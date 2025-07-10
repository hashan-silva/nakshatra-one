variable "compartment_ocid" {
  description = "OCID of the compartment where resources will be deployed."
  type        = string
}

variable "ssh_public_key" {
  description = "Public SSH key for accessing the instances."
  type        = string
}

variable "frontend_docker_image" {
  description = "Docker image for the frontend application (e.g., 'phx.ocir.io/your_tenancy/your_repo/frontend:latest')."
  type        = string
}

variable "backend_docker_image" {
  description = "Docker image for the backend application (e.g., 'phx.ocir.io/your_tenancy/your_repo/backend:latest')."
  type        = string
}