/*
 * Copyright (c) 2019 Oracle and/or its affiliates. All rights reserved.
 */
/*
* ORM only requires region to be defined for provider.
* https://docs.cloud.oracle.com/iaas/Content/ResourceManager/Tasks/usingconsole.htm
*/

provider "oci" {
  version = ">=3.85,<=3.90"
  region  = var.region
}

provider "oci" {
  version = ">=3.85,<=3.90"
  alias   = "home"
  region  = local.home_region
}

terraform {
  required_providers {
    oci = {
      version = ">=3.85
      source = "hashicorp/oci"
    }
  }
}