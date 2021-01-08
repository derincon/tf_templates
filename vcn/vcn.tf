resource "oci_core_virtual_network" "vcn" {
    cidr_block = var.vcn_cidr_block
    compartment_id = var.compartment_id
    display_name = var.vcn_display_name
    dns_label = var.vcn_dns_label
}