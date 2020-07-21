resource "tencentcloud_cdn_domain" "default" {
  domain         = trimspace(var.domain)
  service_type   = var.service_type
  area           = var.area
  full_url_cache = var.full_url_cache

  origin {
    origin_type          = var.origin_type
    origin_list          = var.origin_list
    server_name          = var.server_name
    cos_private_access   = var.cos_private_access
    origin_pull_protocol = var.origin_pull_protocol
  }

  https_config {
    https_switch         = var.https_switch
    http2_switch         = var.http2_switch
    ocsp_stapling_switch = var.ocsp_stapling_switch
    spdy_switch          = var.spdy_switch
    verify_client        = var.verify_client

    dynamic "server_certificate_config" {
      for_each = local.server_certificate_config
      content {
        certificate_id      = lookup(server_certificate_config.value, "certificate_id")
        certificate_content = lookup(server_certificate_config.value, "certificate_content")
        private_key         = lookup(server_certificate_config.value, "private_key")
        message             = lookup(server_certificate_config.value, "message")
      }
    }

    dynamic "client_certificate_config" {
      for_each = local.client_certificate_config
      content {
        certificate_content = lookup(client_certificate_config.value, "certificate_content")
      }
    }
  }

  tags = var.tags
}

locals {
  server_certificate_config = flatten([
  for _, obj in var.server_certificate_config : {
    certificate_id      = lookup(obj, "certificate_id", null)
    certificate_content = lookup(obj, "certificate_content", null)
    private_key         = lookup(obj, "private_key", null)
    message             = lookup(obj, "message", null)
  }])

  client_certificate_config = flatten([
  for _, obj in var.client_certificate_config : {
    certificate_content = lookup(obj, "certificate_content", null)
  }])
}