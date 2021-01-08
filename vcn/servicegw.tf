data "oci_core_services" "test_services" {
  filter {
    name   = "name"
    values = ["All .* Services In Oracle Services Network"]
    regex  = true
  }
}

resource "oci_core_service_gateway" "service_gateway" {
  count = var.servicegw ? 1 : 0
  compartment_id = var.compartment_id
  services {
    service_id = data.oci_core_services.test_services.services[0]["id"]
  }

  vcn_id = oci_core_virtual_network.vcn.id
  display_name   = "${var.vcn_display_name}-SG"
}

resource "oci_core_default_route_table" "service_gateway_rt" {
  count = var.natgw ? 1 : 0 
  manage_default_resource_id = oci_core_virtual_network.vcn.default_route_table_id
  route_rules {
    destination       = lookup(data.oci_core_services.test_services.services[0],"cidr_block")
    destination_type  = "SERVICE_CIDR_BLOCK"
    network_entity_id = element(concat(oci_core_service_gateway.service_gateway.*.id, list("")), 0)
    description       = var.sgw_route_table_rule_description
  }
}

output "service_gateway_id" {
  description = "ocid of service gateway. "
  value = element(concat(oci_core_service_gateway.service_gateway.*.id, list("")), 0)
}