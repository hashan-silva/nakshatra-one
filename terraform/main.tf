
# Configure the Oracle Cloud Infrastructure (OCI) Provider
provider "oci" {
  auth = "InstancePrincipal" # Use Instance Principal for CI/CD
  # Alternatively, for API Key authentication via environment variables:
  # tenancy_ocid = var.tenancy_ocid
  # user_ocid = var.user_ocid
  # fingerprint = var.fingerprint
  # private_key_path = var.private_key_path
  # region = var.region
}

# Define a Virtual Cloud Network (VCN)
resource "oci_core_vcn" "nakshatra_one_vcn" {
  cidr_block = "10.0.0.0/16"
  compartment_id = var.compartment_ocid
  display_name = "nakshatra_one_vcn"
  dns_label = "nakshatraonevcn"
}

# Define a Public Subnet for Frontend
resource "oci_core_subnet" "frontend_subnet" {
  cidr_block = "10.0.1.0/24"
  compartment_id = var.compartment_ocid
  vcn_id = oci_core_vcn.nakshatra_one_vcn.id
  display_name = "frontend_subnet"
  dns_label = "frontendsubnet"
  route_table_id = oci_core_vcn.nakshatra_one_vcn.default_route_table_id
  security_list_ids = [oci_core_vcn.nakshatra_one_vcn.default_security_list_id]
}

# Define a Private Subnet for Backend
resource "oci_core_subnet" "backend_subnet" {
  cidr_block = "10.0.2.0/24"
  compartment_id = var.compartment_ocid
  vcn_id = oci_core_vcn.nakshatra_one_vcn.id
  display_name = "backend_subnet"
  dns_label = "backendsubnet"
  route_table_id = oci_core_vcn.nakshatra_one_vcn.default_route_table_id
  security_list_ids = [oci_core_vcn.nakshatra_one_vcn.default_security_list_id]
}

# Define Security List Rules for Frontend (e.g., HTTP/HTTPS ingress)
resource "oci_core_security_list" "frontend_security_list" {
  compartment_id = var.compartment_ocid
  vcn_id = oci_core_vcn.nakshatra_one_vcn.id
  display_name = "frontend_security_list"

  ingress_security_rules {
    protocol = "6" # TCP
    source = "0.0.0.0/0"
    tcp_options {
      min = 80
      max = 80
    }
  }
  ingress_security_rules {
    protocol = "6" # TCP
    source = "0.0.0.0/0"
    tcp_options {
      min = 443
      max = 443
    }
  }
  # Allow all egress traffic
  egress_security_rules {
    protocol = "all"
    destination = "0.0.0.0/0"
  }
}

# Define Security List Rules for Backend (e.g., allow traffic from frontend subnet)
resource "oci_core_security_list" "backend_security_list" {
  compartment_id = var.compartment_ocid
  vcn_id = oci_core_vcn.nakshatra_one_vcn.id
  display_name = "backend_security_list"

  ingress_security_rules {
    protocol = "6" # TCP
    source = oci_core_subnet.frontend_subnet.cidr_block
    tcp_options {
      min = 8080 # Assuming backend runs on 8080
      max = 8080
    }
  }
  # Allow all egress traffic
  egress_security_rules {
    protocol = "all"
    destination = "0.0.0.0/0"
  }
}

# Create Frontend Compute Instance
resource "oci_core_instance" "frontend_instance" {
  availability_domain = data.oci_identity_availability_domains.ads.availability_domains[0].name
  compartment_id = var.compartment_ocid
  display_name = "nakshatra_one_frontend"
  shape = "VM.Standard.E2.1.Micro" # Or another suitable shape
  source_details {
    source_type = "image"
    image_id = data.oci_core_images.oracle_linux.images[0].id
  }
  create_vnic_details {
    subnet_id = oci_core_subnet.frontend_subnet.id
    display_name = "frontend_vnic"
    assign_public_ip = true
    security_list_ids = [oci_core_security_list.frontend_security_list.id]
  }
  metadata = {
    ssh_authorized_keys = var.ssh_public_key
    user_data = base64encode(templatefile("${path.module}/scripts/frontend_setup.sh", {
      docker_image = var.frontend_docker_image
    }))
  }
}

# Create Backend Compute Instance
resource "oci_core_instance" "backend_instance" {
  availability_domain = data.oci_identity_availability_domains.ads.availability_domains[0].name
  compartment_id = var.compartment_ocid
  display_name = "nakshatra_one_backend"
  shape = "VM.Standard.E2.1.Micro" # Or another suitable shape
  source_details {
    source_type = "image"
    image_id = data.oci_core_images.oracle_linux.images[0].id
  }
  create_vnic_details {
    subnet_id = oci_core_subnet.backend_subnet.id
    display_name = "backend_vnic"
    assign_public_ip = false # Private IP only for backend
    security_list_ids = [oci_core_security_list.backend_security_list.id]
  }
  metadata = {
    ssh_authorized_keys = var.ssh_public_key
    user_data = base64encode(templatefile("${path.module}/scripts/backend_setup.sh", {
      docker_image = var.backend_docker_image
    }))
  }
}

# Data sources for dynamic lookups
data "oci_identity_availability_domains" "ads" {
  compartment_id = var.compartment_ocid
}

data "oci_core_images" "oracle_linux" {
  compartment_id = var.compartment_ocid
  operating_system = "Oracle Linux"
  operating_system_version = "8" # Or desired version
  shape = "VM.Standard.E2.1.Micro" # Match instance shape
  # Add more filters if needed to get a specific image
}

# Dynamic Group for Compute Instances
resource "oci_identity_dynamic_group" "instance_dynamic_group" {
  compartment_id = var.compartment_ocid
  description = "Dynamic Group for NakshatraOne Compute Instances"
  name = "NakshatraOneInstancesDynamicGroup"
  matching_rule = "ALL {instance.compartment.id = '%s'}" # Matches all instances in the compartment
}

# IAM Policy for Instance Principal
resource "oci_identity_policy" "instance_principal_policy" {
  compartment_id = var.compartment_ocid
  description = "Policy for NakshatraOne Compute Instances to manage VNICs, read images, and pull from OCIR"
  name = "NakshatraOneInstancePrincipalPolicy"
  statements = [
    "Allow dynamic-group oci_identity_dynamic_group.instance_dynamic_group to manage vnics in compartment id %s",
    "Allow dynamic-group oci_identity_dynamic_group.instance_dynamic_group to read instance-images in compartment id %s",
    "Allow dynamic-group oci_identity_dynamic_group.instance_dynamic_group to use ons-topics in compartment id %s", # For notifications if needed
    "Allow dynamic-group oci_identity_dynamic_group.instance_dynamic_group to manage repos in compartment id %s", # For pulling from OCIR
    "Allow dynamic-group oci_identity_dynamic_group.instance_dynamic_group to inspect repos in tenancy", # For inspecting OCIR repos
  ]
}


