/*
 * Copyright (c) 2019 Oracle and/or its affiliates. All rights reserved.
 */
/*
* ORM only requires region to be defined for provider.
* https://docs.cloud.oracle.com/iaas/Content/ResourceManager/Tasks/usingconsole.htm
*/

provider "oci" {
  region  = var.region
}

provider "oci" {
  alias   = "home"
  region  = local.home_region
}