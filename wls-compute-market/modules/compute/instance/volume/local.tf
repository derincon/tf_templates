/*
 * Copyright (c) 2020, Oracle and/or its affiliates. All rights reserved.
 */

locals {
  ad_number   = compact(data.template_file.ad_number.*.rendered)
}