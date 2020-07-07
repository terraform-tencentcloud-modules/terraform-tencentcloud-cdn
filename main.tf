provider "tencentcloud" {
  version = ">=1.19.0"
  region  = var.region != "" ? var.region : null
}

resource "tencentcloud_cdn_domain" "default" {
  project_id     = var.project_id < 0 ? 0 : var.project_id
  domain         = trimspace(var.domain)
  service_type   = var.service_type
  area           = var.area
  full_url_cache = var.full_url_cache
  origin {
    origin_type          = var.origin.origin_type
    origin_list          = var.origin.origin_list
    server_name          = trimspace(var.origin.server_name)
    cos_private_access   = var.origin.cos_private_access
    origin_pull_protocol = var.origin.origin_pull_protocol
  }

  https_config {
    https_switch         = var.https_config.https_switch
    http2_switch         = var.https_config.http2_switch
    ocsp_stapling_switch = var.https_config.ocsp_stapling_switch
    spdy_switch          = var.https_config.spdy_switch
    verify_client        = var.https_config.verify_client
  }

  tags = merge(
  {
    "Name" = format("%s", var.domain)
  }, var.tags, )

}

data "tencentcloud_cdn_domains" "foo" {
  domain = local.domain
}

locals {
  domain = tencentcloud_cdn_domain.default.domain
}