resource "oci_core_internet_gateway" "internet_gateway" {
    count = var.internetgw ? 1 : 0
    compartment_id = var.compartment_id
    vcn_id = oci_core_virtual_network.vcn.id
    display_name = "${var.vcn_display_name}-IG"
}

resource "oci_core_default_route_table" "internet_gateway_rt" {
  count = var.natgw ? 1 : 0 
  manage_default_resource_id = oci_core_virtual_network.vcn.default_route_table_id
  route_rules {
    destination       = var.igw_route_cidr_block
    network_entity_id = element(concat(oci_core_internet_gateway.internet_gateway.*.id, list("")), 0)
    description       = var.igw_route_table_rule_description
  }
}

output "internet_gateway_id" {
  description = "ocid of internet gateway. "
  value = element(concat(oci_core_internet_gateway.internet_gateway.*.id, list("")), 0)
}