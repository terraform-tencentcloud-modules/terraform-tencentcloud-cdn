output "project_id" {
  description = "Project CDN belongs to."
  value       = tencentcloud_cdn_domain.default.*.project_id
}
output "cname" {
  description = "CNAME address of domain name."
  value       = tencentcloud_cdn_domain.default.*.cname
}

output "create_time" {
  description = "Domain name creation time."
  value       = tencentcloud_cdn_domain.default.*.create_time
}

output "status" {
  description = "Acceleration service status."
  value       = tencentcloud_cdn_domain.default.*.status
}
