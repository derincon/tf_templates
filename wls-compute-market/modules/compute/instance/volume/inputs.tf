/*
 * Copyright (c) 2020, Oracle and/or its affiliates. All rights reserved.
 */

variable "compartment_ocid" {}

variable "availability_domain" {}
variable "compute_name_prefix" {
}

# Defines the number of instances to deploy
variable "numVMInstances" {
  type    = string
  default = "2"
}

variable "volume_size" {
  default = "50"
}

variable "defined_tags" {
  type=map
  default = {}
}

variable "freeform_tags" {
  type=map
  default = {}
}

variable "use_regional_subnet" {
  type = bool
}

variable "ad_names" {
  type = list
}

variable "ad_number" {
    description = "The availability domain number of the instance. If none is provided, it will start with AD-1 and continue in round-robin."
    type        = string
}

variable "index" {
  default = "0"
}

variable "volume_name" {}
