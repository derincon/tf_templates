variable "compartment_id" {
        type    = string
        default = "compartment-id"
}

variable "vcn_cidr_block" {
        type    = string
        default = "cidr-block"
}

variable "vcn_display_name" {
        type    = string
        default = "display-name"
}

variable "vcn_dns_label" {
        type    = string
        default = "dns-label"
}
variable "natgw" {
        type    = bool
        default = false
}

variable "servicegw" {
        type    = bool
        default = false
}

variable "internetgw" {
        type    = bool
        default = false
}

// PUBLIC AND PRIVATE ROUTETABLE VARIABLES
 
variable "public_route_table_display_name" {
  default = "PublicRoute"
} // Name for the public routetable
 
variable "private_route_table_display_name" {
  default = "PrivateRoute"
} // Name for the private routetable
 
variable "igw_route_cidr_block" {
  default = "0.0.0.0/0"
} 
 
variable "natgw_route_cidr_block" {
  default = "0.0.0.0/0"
} 

// ROUTETABLE RULE DESCRIPTION

variable "natgw_route_table_rule_description" {
  default = "For patches"
} // Name for the public routetable
 
variable "igw_route_table_rule_description" {
  default = "For public incoming request"
}

variable "sgw_route_table_rule_description" {
  default = "For backups"
}

variable "lgpw_route_table_rule_description" {
  default = "PrivateRoute"
}


variable "rt_rules" {
	default = [ {
	        "destination" 		= "lookup(data.oci_core_services.test_services.services[0],\"cidr_block\")"
	        "destination_type" 	= "SERVICE_CIDR_BLOCK"
	        "network_entity_id" = "element(concat(oci_core_service_gateway.service_gateway.*.id, list(\"\")), 0)"
	        "description" 		= "For backups"
	        "isrequired" 		= "var.servicegw"
	    },
	    {
	        "destination" 		= "var.natgw_route_cidr_block"
	        "network_entity_id" = "element(concat(oci_core_nat_gateway.nat_gateway.*.id, list(\"\")), 0)"
	        "description" 		= "For patches"
	        "isrequired" 		= "var.natgw"
	    }]
}


variable "rt_rules" {
	description = "List of route table rules"
	type        = map(object)
	default     = { }
}


cd /u01/DELA_TEST/DEMOVCN && terraform destroy -auto-approve ; cd /u01/ ; rm -rf /u01/DELA_TEST/
value = "${element(concat(oci_core_nat_gateway.nat_gateway.*.id, list("")), 0)}"
oci_core_nat_gateway.nat_gateway.id