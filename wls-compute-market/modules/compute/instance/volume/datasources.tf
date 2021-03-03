/*
 * Copyright (c) 2019, 2020 Oracle and/or its affiliates. All rights reserved.
 */
# Gets a list of Availability Domains in the tenancy
data "oci_identity_availability_domains" "ADs" {
  compartment_id = var.compartment_ocid
}

data "template_file" "ad_number" {
  template  =  (element(data.oci_identity_availability_domains.ADs.availability_domains, (var.ad_number - 1))).name
}
