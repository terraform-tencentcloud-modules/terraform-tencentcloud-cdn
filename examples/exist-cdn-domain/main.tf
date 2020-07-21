module "cdn" {
  source       = "../../"
  domain       = "test.zhaoshaona.com"
  service_type = "web"
  origin_type  = "ip"
  origin_list  = ["172.199.199.130"]
}
