provider "tencentcloud" {
  region = "ap-guangzhou"
}

module "cdn" {
  source       = "../../"
  domain       = "test999.zhaoshaona.com"
  service_type = "web"
  https_switch = "off"
  origin_type  = "ip"
  origin_list  = ["172.199.199.130"]
}
