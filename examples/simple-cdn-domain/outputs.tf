output "ip_origin_project_id" {
  description = "Project CDN belongs to."
  value       = module.ip_cdn.project_id
}

output "cname" {
  description = "CNAME address of domain name."
  value       = module.ip_cdn.cname
}

output "create_time" {
  description = "Domain name creation time."
  value       = module.ip_cdn.create_time
}

output "status" {
  description = "Acceleration service status."
  value       = module.ip_cdn.status
}

output "cos_origin_project_id" {
  description = "Project CDN belongs to."
  value       = module.cos_cdn.project_id
}

output "cname" {
  description = "CNAME address of domain name."
  value       = module.cos_cdn.cname
}

output "create_time" {
  description = "Domain name creation time."
  value       = module.cos_cdn.create_time
}

output "status" {
  description = "Acceleration service status."
  value       = module.cos_cdn.status
}

