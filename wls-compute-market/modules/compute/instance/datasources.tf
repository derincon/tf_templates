/*
 * Copyright (c) 2019, 2020 Oracle and/or its affiliates. All rights reserved.
 */
# Gets a list of Availability Domains in the tenancy
data "oci_identity_availability_domains" "ADs" {
  compartment_id = var.tenancy_ocid
}

data "oci_identity_fault_domains" "wls_fault_domains" {
  #Required
  availability_domain = var.availability_domain
  compartment_id      = var.compartment_ocid
}

data "oci_database_db_systems" "ocidb_db_systems" {
  count = local.is_oci_db? 1: 0

  #Required
  compartment_id = var.ocidb_compartment_id

  filter {
    name   = "id"
    values = [var.ocidb_dbsystem_id]
  }
}

data "oci_database_database" "ocidb_database" {
  count = local.is_oci_db? 1: 0

  #Required
  database_id = var.ocidb_database_id
}

data "oci_database_db_home" "ocidb_db_home" {
  count = local.is_oci_db? 1: 0

  #Required
  db_home_id = data.oci_database_database.ocidb_database[0].db_home_id
}

data "oci_database_autonomous_database" "atp_db" {
  count = local.is_atp_db?1:0

  #Required
  autonomous_database_id = var.atp_db_id
}

### Application DB Support ###
data "oci_database_db_systems" "appdb_db_systems" {
  count = local.is_oci_app_db? 1: 0

  #Required
  compartment_id = var.appdb_compartment_id

  filter {
    name   = "id"
    values = [var.appdb_dbsystem_id]
  }
}

data "oci_database_database" "appdb_database" {
  count = local.is_oci_app_db? 1: 0

  #Required
  database_id = var.appdb_database_id
}

data "oci_database_db_home" "appdb_db_home" {
  count = local.is_oci_app_db? 1: 0

  #Required
  db_home_id = data.oci_database_database.appdb_database[0].db_home_id
}

data "oci_database_autonomous_database" "app_atp_db" {
  count = local.is_atp_app_db?1:0

  #Required
  autonomous_database_id = var.app_atp_db_id
}

data "template_file" "key_script" {
  template = file("./modules/compute/instance/templates/keys.tpl")

  vars = {
    pubKey     = var.opc_key["public_key_openssh"]

    oracleKey  = var.oracle_key["public_key_openssh"]
    oraclePriKey = var.oracle_key["private_key_pem"]
  }
}

data "oci_core_subnet" "wls_subnet" {
  count = var.wls_subnet_id == "" ? 0 : 1

  #Required
  subnet_id = var.wls_subnet_id
}

data "template_file" "ad_names" {
  count    = length(data.oci_identity_availability_domains.ADs.availability_domains)
  template =  (var.instance_shape=="VM.Standard.E3.Flex" || (tonumber(lookup(data.oci_limits_limit_values.compute_shape_service_limits[count.index].limit_values[0], "value")) > 0))?lookup(data.oci_identity_availability_domains.ADs.availability_domains[count.index], "name"):""
}

data "template_file" "ad_number" {
  template  =  (element(data.oci_identity_availability_domains.ADs.availability_domains, (var.ad_number - 1))).name
}

data "oci_limits_limit_values" "compute_shape_service_limits" {
    count    = length(data.oci_identity_availability_domains.ADs.availability_domains)
    #Required
    compartment_id = var.tenancy_ocid
    service_name = "compute"

    #Optional
    availability_domain = lookup(data.oci_identity_availability_domains.ADs.availability_domains[count.index], "name")
    #format of name field -vm-standard2-2-count
    #ignore flex shapes
    name = var.instance_shape=="VM.Standard.E3.Flex"?"":format("%s-count",replace(var.instance_shape, ".", "-"))
}

data "oci_core_shapes" "oci_shapes" {
  count    = length(data.oci_identity_availability_domains.ADs.availability_domains)
  #Required
  compartment_id = var.compartment_ocid
  image_id = var.instance_image_ocid
  availability_domain = lookup(data.oci_identity_availability_domains.ADs.availability_domains[count.index], "name")
  filter {
    name ="name"
    values= ["${var.instance_shape}"]
  }
}

# Infra DB Private IP
# Case 1: RAC DB. Fetch the scan-ip list
data "oci_core_private_ip" "infra_db_scan_ip" {
  count = var.disable_infra_db_vcn_peering ? length(data.oci_database_db_systems.ocidb_db_systems[0].db_systems[0].scan_ip_ids) : 0

  private_ip_id = data.oci_database_db_systems.ocidb_db_systems[0].db_systems[0].scan_ip_ids[count.index]
}

data "oci_database_db_nodes" "ocidb_dbNode_list" {
  count = var.disable_infra_db_vcn_peering? 1: 0
  #Required
  compartment_id = var.compartment_ocid
  db_system_id = var.ocidb_dbsystem_id
}

data "oci_database_db_node" "oci_db_node" {
  count = var.disable_infra_db_vcn_peering? local.infradb_node_count : 0
  #Required
  db_node_id = data.oci_database_db_nodes.ocidb_dbNode_list[0].db_nodes[count.index].db_node_id
}

# For multi node DB
data "oci_core_vnic" "oci_db_vnic" {
  count = var.disable_infra_db_vcn_peering && local.infradb_node_count > 1 ? local.infradb_node_count : 0
  #Required
  vnic_id = data.oci_database_db_node.oci_db_node[count.index].vnic_id
}

# For single Node DB
data "oci_core_vnic" "oci_db_vnic_single_node" {
  count = var.disable_infra_db_vcn_peering && local.infradb_node_count == 1 ? 1 : 0
  #Required
  vnic_id = data.oci_database_db_node.oci_db_node[0].vnic_id
}

#APP DB private IP
# Case 1: RAC DB. Fetch the scan-ip list
data "oci_core_private_ip" "app_db_scan_ip" {
  count = var.disable_app_db_vcn_peering ? local.appdb_scanip_count : 0
  private_ip_id = data.oci_database_db_systems.appdb_db_systems[0].db_systems[0].scan_ip_ids[count.index]
}

data "oci_database_db_nodes" "appdb_dbNode_list" {
  count = var.disable_app_db_vcn_peering && var.configure_app_db? 1: 0
  #Required
  compartment_id = var.appdb_compartment_id
  db_system_id = var.appdb_dbsystem_id
}

data "oci_database_db_node" "appdb_db_node" {
  count = var.disable_app_db_vcn_peering && var.configure_app_db? local.appdb_node_count: 0
  #Required
  db_node_id = data.oci_database_db_nodes.appdb_dbNode_list[0].db_nodes[count.index].db_node_id
}

# For multi node AppDB
data "oci_core_vnic" "app_db_vnic" {
  count = var.disable_app_db_vcn_peering && var.configure_app_db ? local.appdb_node_count : 0
  #Required
  vnic_id = data.oci_database_db_node.appdb_db_node[count.index].vnic_id
}

# For single Node AppDB
data "oci_core_vnic" "app_db_vnic_single_node" {
  count = var.disable_app_db_vcn_peering && local.appdb_node_count == 1 ? 1 : 0
  #Required
  vnic_id = data.oci_database_db_node.appdb_db_node[0].vnic_id
}
