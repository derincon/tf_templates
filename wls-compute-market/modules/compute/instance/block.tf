/*
 * Copyright (c) 2019, 2020, Oracle and/or its affiliates. All rights reserved.
 */


resource "oci_core_volume_attachment" "wls-block-volume-attach-app" {
  count           =  local.is_oci_db  && local.is_apply_JRF? var.numVMInstances * var.num_volumes: 0
  display_name    = "${var.compute_name_prefix}-block-volume-attach-${count.index}"
  attachment_type = "iscsi"
  instance_id     = oci_core_instance.wls_instance.*.id[count.index / var.num_volumes]
  volume_id       = module.middleware-volume.DataVolumeOcids[count.index / var.num_volumes]
}

resource "oci_core_volume_attachment" "wls-block-volume-attach-data" {
  count           = local.is_oci_db  && local.is_apply_JRF? var.numVMInstances * var.num_volumes: 0
  display_name    = "${var.compute_name_prefix}-block-volume-attach-${count.index}"
  attachment_type = "iscsi"
  instance_id     = oci_core_instance.wls_instance.*.id[count.index / var.num_volumes]
  volume_id       = module.data-volume.DataVolumeOcids[count.index/ var.num_volumes]
}