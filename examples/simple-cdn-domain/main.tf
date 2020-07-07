variable "region" {
  default = ""
}

provider "tencentcloud" {
  region = var.region
}

module "cdn" {
  source = "../../"
  region = var.region

  project_id     = 0
  domain         = "test999.zhaoshaona.com"
  service_type   = "web"
  area           = "mainland"
  full_url_cache = false
  origin         = {
    origin_type          = "ip"
    origin_list          = ["172.199.199.130"]
    server_name          = "test999.zhaoshaona.com"
    cos_private_access   = "off"
    origin_pull_protocol = "http"
    backup_origin_type   = "ip"
  }

  https_config = {
    https_switch         = "off"
    http2_switch         = "off"
    ocsp_stapling_switch = "off"
    spdy_switch          = "off"
    verify_client        = "off"
  }

}
