/*
 * Copyright (c) 2019, 2020, Oracle and/or its affiliates. All rights reserved.
 */
variable "tenancy_ocid" {}
variable "availability_domain" {}
variable "compartment_ocid" {}

variable "region" {}

variable "instance_shape" {
  type = string
}

variable "instance_name" {
  default = "bastion-instance"
}

variable "instance_count" {}

variable "vm_count" {
  description = "Number of wls vm nodes"
}

variable "is_bastion_instance_required" {
  type = bool
  default = true
}

variable "existing_bastion_instance_id" {
  type        = string
}

variable "bastion_subnet_ocid" {
  type = list
}

variable "ssh_public_key" {
  type = string
}

variable "bastion_bootstrap_file" {
  type    = string
  default = "./modules/compute/bastion-instance/userdata/bastion-bootstrap"
}

variable "instance_image_id" {
  type = string
}

variable "defined_tags" {
  type=map
  default = {}
}

variable "freeform_tags" {
  type=map
  default = {}
}

variable "use_existing_subnet" {
  type = bool
}

variable "patching_tool_key" {
  default = "wiPECMve6esBkBF0g6c5mQ=="
  type = string
}

variable "wls_version" {
  type = string
}

variable "patching_supported_actions" {
  type = string
  default = "setup,list,info,download,upgrade"
}