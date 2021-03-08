/*
 * Copyright (c) 2020, Oracle and/or its affiliates. All rights reserved.
 */

# Output the private and public IPs of the instance
output "InstancePrivateIPs" {
  value = coalescelist(oci_core_instance.wls_instance.*.private_ip, list(""))
}

output "InstancePublicIPs" {
  value = coalescelist(oci_core_instance.wls_instance.*.public_ip, list(""))
}

output "InstanceOcids" {
  value = coalescelist(oci_core_instance.wls_instance.*.id, list(""))
}

output "display_names" {
  value = coalescelist(oci_core_instance.wls_instance.*.display_name, list(""))
}

output "WlsVersion" {
  value = var.wls_version
}

output "InstanceShapes" {
  value = coalescelist(oci_core_instance.wls_instance.*.shape, list(""))
}

output "AvailabilityDomains" {
  value = coalescelist(oci_core_instance.wls_instance.*.availability_domain, list(""))
}