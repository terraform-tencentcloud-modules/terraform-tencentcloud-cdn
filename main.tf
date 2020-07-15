provider "tencentcloud" {
  version = ">=1.19.0"
  region  = var.region != "" ? var.region : null
}

resource "tencentcloud_cdn_domain" "default" {
  domain       = trimspace(var.domain)
  service_type = var.service_type

  origin {
    origin_type = var.origin_type
    origin_list = var.origin_list
  }

  https_config {
    https_switch = var.https_switch
  }

}

data "tencentcloud_cdn_domains" "foo" {
  domain = local.domain
}

locals {
  domain = tencentcloud_cdn_domain.default.domain
}