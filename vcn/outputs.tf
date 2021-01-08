// Copyright (c) 2018, Oracle and/or its affiliates. All rights reserved.

output "vcn_id" {
  description = "ocid of created VCN. "
  value       = oci_core_virtual_network.vcn.id
}

output "default_security_list_id" {
  description = "ocid of default security list. "
  value       = oci_core_virtual_network.vcn.default_security_list_id
}

output "default_dhcp_id" {
  description = "ocid of default DHCP. "
  value       = oci_core_virtual_network.vcn.default_dhcp_options_id
}

output "default_route_table_id" {
  description = "ocid of default route table. "
  value       = oci_core_virtual_network.vcn.default_route_table_id
}

locals {
	required_rules = {
	        "destination" 		= lookup(data.oci_core_services.test_services.services[0],"cidr_block")
	        "destination_type" 	= "SERVICE_CIDR_BLOCK"
	        "network_entity_id" = element(concat(oci_core_service_gateway.service_gateway.*.id, list("")), 0)
	        "description" 		= "For backups"
	        "isrequired" 		= var.servicegw
	    },
	    {
	        "destination" 		= var.natgw_route_cidr_block
	        "network_entity_id" = element(concat(oci_core_nat_gateway.nat_gateway.*.id, list("")), 0)
	        "description" 		= "For patches"
	        "isrequired" 		= var.natgw
	    }
	rules = merge(var.rt_rules, local.required_rules)
}

output "out_rules" {
    value = [ 
    	for rule in var.rt_rules: {
	      destination   	= "${rule.isrequired ? rule.destination : null}"
	      destination_type 	= "${rule.isrequired ? rule.destination_type : null}"
	      description 		= "${rule.isrequired ? rule.description : null}"
	      network_entity_id = "${rule.isrequired ? rule.network_entity_id : null}"
		}
	]
}
# output "healthcheck_ids" {
#     value = {
#         for hc in aws_route53_health_check.prod-hc :
#         hc_id = hc.id
#     }
# }

output "subnet" {
    value = [
        for ip, ip_value in var.servers :
            { ip_address = ip_value }
    ]
}