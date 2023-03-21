locals {
  create_cache_key        = length(keys(var.cache_key)) > 0
  create_header_rules     = var.request_switch == "on" && length(keys(var.header_rules)) > 0
  domain                  = tencentcloud_cdn_domain.default.domain
}

data "tencentcloud_cdn_domain_verifier" "vr" {
  domain                  = trimspace(local.domain)
  auto_verify             = true
  verify_type             = "dns"
}

resource "tencentcloud_dnspod_record" "_record" {
  domain                  = trimspace(local.domain)
  sub_domain              = data.tencentcloud_cdn_domain_verifier.vr.sub_domain
  record_line             = "默认"
  record_type             = data.tencentcloud_cdn_domain_verifier.vr.record_type
  value                   = data.tencentcloud_cdn_domain_verifier.vr.record
}

resource "tencentcloud_cdn_domain" "default" {
  domain                  = trimspace(var.domain)
  service_type            = var.service_type
  area                    = var.area

  dynamic "cache_key" {
    for_each = local.create_cache_key ? [var.cache_key] : []
    content {
      full_url_cache        = lookup(cache_key.value, "full_url_cache", "on")

      dynamic "query_string" {
        for_each = [lookup(cache_key.value, "query_string", {})]

        content {
          action              = lookup(query_string.value, "action", "includeAll")
          reorder             = lookup(query_string.value, "reorder", "off")
          switch              = lookup(query_string.value, "switch", "off")
          value               = lookup(query_string.value, "value", "")
        }
      }
    }
  }

  origin {
    origin_type           = var.origin_type
    origin_list           = var.origin_list
    origin_pull_protocol  = var.origin_pull_protocol
    cos_private_access    = var.cos_private_access
    server_name           = var.origin_type == "cos" ? var.origin_list[0] : var.domain
  }

  https_config {
    https_switch          = var.https_switch
    http2_switch          = var.http2_switch
    ocsp_stapling_switch  = var.ocsp_stapling_switch
    spdy_switch           = var.spdy_switch
    verify_client         = var.verify_client

    dynamic "force_redirect" {
      for_each = length(keys(var.force_redirect)) > 0 ? [var.force_redirect] : []

      content {
        carry_headers         = lookup(force_redirect.value, "carry_headers", "off")
        redirect_status_code  = lookup(force_redirect.value, "redirect_status_code", 302)
        redirect_type         = lookup(force_redirect.value, "redirect_type", "http")
        switch                = lookup(force_redirect.value, "switch", "off")
      }
    }
  }

  request_header {
    switch               = var.request_switch
    dynamic "header_rules" {
      for_each           = local.create_header_rules ? [var.header_rules] : []
      content {
        header_mode           = header_rules.value["header_mode"]
        header_name           = header_rules.value["header_name"]
        header_value          = header_rules.value["header_value"]
        rule_paths            = header_rules.value["rule_paths"]
        rule_type             = header_rules.value["rule_type"]
      }
    }
  }

  tags                    = var.tags

}

resource "tencentcloud_dnspod_record" "dns" {
  domain                  = trimspace(var.domain)
  record_type             = "CNAME"
  record_line             = "默认"
  value                   = tencentcloud_cdn_domain.default.cname
}

resource "tencentcloud_cdn_url_purge" "url_purge" {
  count                   = length(var.url_purge) > 0 ? 1 : 0
  urls                    = var.url_purge
}

resource "tencentcloud_cdn_url_push" "url_push" {
  count                   = length(var.url_push) > 0 ? 1 : 0
  urls                    = var.url_push
  area                    = var.area
}

data "tencentcloud_cdn_domains" "foo" {
  domain                  = local.domain
}
