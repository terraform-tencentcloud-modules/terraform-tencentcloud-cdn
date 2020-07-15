output "project_id" {
  description = "Project CDN belongs to."
  value       = module.cdn.project_id
}

output "cname" {
  description = "CNAME address of domain name."
  value       = module.cdn.cname
}

output "create_time" {
  description = "Domain name creation time."
  value       = module.cdn.create_time
}

output "status" {
  description = "Acceleration service status."
  value       = module.cdn.status
}
