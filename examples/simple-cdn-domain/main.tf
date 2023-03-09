locals {
  domain      = var.domain
  ip          = var.ip
  cos_bucket  = var.cos_bucket
}

/*
* origin_type = "ip"
*/
module "ip_cdn" {
  source         = "../../"
  domain         = local.domain
  service_type   = "web"
  area           = "overseas"
  cache_key      = {
    full_url_cache       = "off"
  }
  https_switch   = "on"

  request_switch = "off"
  force_redirect = {
    switch               = "on"
    redirect_type        = "http"
  }

  header_rules = {
    header_mode  = "add"
    header_name  = "tf-header-name"
    header_value = "tf-header-value"
    rule_type    = "all"
    rule_paths   = ["*"]
  }

  origin_type            = "ip"
  origin_list            = ["${var.ip}"]

  tags = {
    hello = "world"
  }

  url_push = ["https://${trimspace(local.domain)}/index.html"]

  url_purge = ["https://${trimspace(local.domain)}/index.html"]
}


/*
* origin_type = "cos"
*/
data "tencentcloud_cos_buckets" "cos_buckets" {
  bucket_prefix      = var.cos_bucket
  result_output_file = "./path/cos_bucket.json"
}

module "cos_cdn" {
  source         = "../../"
  domain         = local.domain
  service_type   = "web"
  area           = "overseas"
  cache_key      = {
    full_url_cache       = "off"
  }

  request_switch = "off"
  force_redirect = {
    switch               = "on"
    redirect_type        = "http"
  }
  header_rules = {
    header_mode  = "add"
    header_name  = "tf-header-name"
    header_value = "tf-header-value"
    rule_type    = "all"
    rule_paths   = ["*"]
  }

  origin_type            = "cos"
  origin_list            = ["${data.tencentcloud_cos_buckets.cos_buckets.bucket_list[0].cos_bucket_url}"]
  cos_private_access     = "on"

  tags = {
    hello = "world"
  }
}
