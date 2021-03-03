variable "marketplace_source_images" {
  type = map(object({
    ocid = string
    is_pricing_associated = bool
    compatible_shapes = set(string)
  }))
  default = {
    main_mktpl_image = {
      ocid = "ocid1.image.oc1..aaaaaaaa5sqam6txe4fvebz7kc2a7dh4xnufabhelkfehkuwdrkmxrw6seuq"
      is_pricing_associated = true
      compatible_shapes = []
    }
    baselinux_instance_image = {
      ocid = "ocid1.image.oc1..aaaaaaaanvui7teqxr7mkiyta2gw5ollzdhxi7nl2yijlowker5qwxfgjj2q"
      is_pricing_associated = false
      compatible_shapes = []
    }
  }
}
