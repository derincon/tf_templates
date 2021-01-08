resource "oci_core_default_route_table" "route_table" {
  manage_default_resource_id = oci_core_virtual_network.vcn.default_route_table_id
  display_name   = "${var.vcn_display_name}-RT"

}