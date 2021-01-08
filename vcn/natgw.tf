resource "oci_core_nat_gateway" "nat_gateway" {
  count = var.natgw ? 1 : 0
  compartment_id = var.compartment_id
  vcn_id         = oci_core_virtual_network.vcn.id
  display_name   = "${var.vcn_display_name}-NG"
}

resource "oci_core_default_route_table" "nat_gateway_rt[1]" {
  count = var.natgw ? 1 : 0 
  manage_default_resource_id = oci_core_virtual_network.vcn.default_route_table_id
  route_rules {
    destination       = var.natgw_route_cidr_block
    network_entity_id = element(concat(oci_core_nat_gateway.nat_gateway.*.id, list("")), 0)
    description  = var.natgw_route_table_rule_description
  }
}

output "nat_gateway_id" {
  description = "ocid of nat gateway. "
  value = element(concat(oci_core_nat_gateway.nat_gateway.*.id, list("")), 0)
}