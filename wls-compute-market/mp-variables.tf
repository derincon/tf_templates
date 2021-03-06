/*
 * Copyright (c) 2020, Oracle and/or its affiliates. All rights reserved.
 */

/* Please do not change these values */

variable "mp_baselinux_instance_image_id" {
  default = "ocid1.image.oc1..aaaaaaaanvui7teqxr7mkiyta2gw5ollzdhxi7nl2yijlowker5qwxfgjj2q"
}

variable "mp_baselinux_listing_id" {
  default = "ocid1.appcataloglisting.oc1..aaaaaaaacicjx6jviqczqow567tadr5ju7iy2m4vx6opyra6thql55n2nnvq"
}

variable "mp_baselinux_listing_resource_version" {
  default = "20.4.3-201217050708"
}

/*
********************
Marketplace UI Parameters
********************
*/
# Controls if we need to subscribe to marketplace PIC image and accept terms & conditions - defaults to true
variable "use_marketplace_image" {
  type    = bool
default = true
}

variable "mp_listing_id" {
default = "ocid1.appcataloglisting.oc1..aaaaaaaa653zc2e4fsem5hhwinmfgnv3xp4dmbq6c6gvf45okxf6xz3smhiq"
}

variable "mp_listing_resource_version" {
default = "21.1.1-210115010654"
}

# Used in UI instead of assign_weblogic_public_ip
variable "subnet_type" {
  default = "Use Public Subnet"
}

# Used in UI instead of use_regional_subnet
variable "subnet_span" {
  default = "Regional Subnet"
}

variable "vcn_strategy" {
  default = ""
}

variable "subnet_strategy_existing_vcn" {
  default = ""
}

variable "subnet_strategy_new_vcn" {
  default = ""
}

variable "db_strategy" {
  default = "No Database"
}

variable "use_advanced_wls_instance_config" {
  type    = bool
  default = false
}

variable "appdb_strategy" {
  default = "No Database"
}
