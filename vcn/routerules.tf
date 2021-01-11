resource "oci_core_default_route_table" "route_table" {
  manage_default_resource_id = oci_core_virtual_network.vcn.default_route_table_id
  display_name   = "${var.vcn_display_name}-RT"

	dynamic "route_rules" {
	  for_each = (var.natgw == true || var.servicegw == true || var.internetgw == true)? list(1) : [] 
	  
	  content {
	    destination       = lookup(data.oci_core_services.all_oci_services[0].services[0], "cidr_block")
	  destination_type  = "SERVICE_CIDR_BLOCK"
	  network_entity_id = oci_core_service_gateway.service_gateway[0].id
	  }
	}

	dynamic "route_rules" {
	    for_each = [for rule in rt_rules: {
	      destination   	= "${rule.isrequired ? rule.destination : null}"
	      destination_type 	= "${rule.isrequired ? rule.destination_type : null}"
	      description 		= "${rule.isrequired ? rule.description : null}"
	      network_entity_id = "${rule.isrequired ? rule.network_entity_id : null}"
	    }]
	    //subnet = "${var.env == "production" ? var.prod_subnet : var.dev_subnet}"
	    content {	      
		  destination   	= route_rules.value.destination
		  destination_type 	= route_rules.value.destination_type
		  description 		= route_rules.value.description
		  network_entity_id = route_rules.value.network_entity_id	      
	    }
	}
}
