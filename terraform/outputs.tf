output "frontend_public_ip" {
  value = oci_core_instance.frontend_instance.public_ip
}

output "backend_private_ip" {
  value = oci_core_instance.backend_instance.private_ip
}