
# TencentCloud CDN  Module for Terraform

## terraform-tencentcloud-cdn

A terraform module used to create CDN domain.

The following resources are included.

* [CDN DOMAIN](https://registry.terraform.io/providers/tencentcloudstack/tencentcloud/latest/docs/resources/cdn_domain)
* [CDN URL PURGE](https://registry.terraform.io/providers/tencentcloudstack/tencentcloud/latest/docs/resources/cdn_url_purge)
* [CDN URL PUSH](https://registry.terraform.io/providers/tencentcloudstack/tencentcloud/latest/docs/resources/cdn_url_push)
* [DNSPOD RECORD](https://registry.terraform.io/providers/tencentcloudstack/tencentcloud/latest/docs/resources/dnspod_record)

## Usage
```hcl
module "cdn" {
  source         = "terraform-tencentcloud-modules/cdn/tencentcloud"
  domain         = var.domain
  service_type   = "web"
  area           = "overseas"
  origin_type    = "ip"
  origin_list    = ["${var.ip}"]
}
```

## Conditional Creation

This module can create CDN domain.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| domain | Name of the acceleration domain. | string | "" | yes 
| area | Domain name acceleration region. | string | "mainland" | no
| follow_redirect_switch | 301/302 redirect following switch. | string | "off" | no
| range_origin_switch | Sharding back to source configuration switch | string | "on" | no
| service_type | Service type of acceleration domain name. | string | ""  | no 
| tags | A map of tags to add to all resources. | map | {} | no 
| origin_type | Master origin server type.  | string| "" | no
| origin_list | Master origin server list. Valid values can be ip or domain name. When modifying the origin server, you need to enter the corresponding `origin_type`.  | list | [] | no 
| origin_pull_protocol | Origin-pull protocol configuration. | string | "follow" | no 
| cos_private_access | When OriginType is COS, you can specify if access to private buckets is allowed. | string | "off" | no 
| https_switch | HTTPS configuration switch. | string | "off" | no 
| http2_switch | HTTP2 configuration switch. | string | "off" | no 
| ocsp_stapling_switch | OCSP configuration switch. | string | "off" | no 
| spdy_switch | Spdy configuration switch.This parameter is for white-list customer. | string|  "off" | no 
| verify_client | Client certificate authentication feature. | string | "off" | no 
| force_redirect | Configuration of forced HTTP or HTTPS redirects. | any | {} | no 
| request_switch | Custom request header configuration switch. | string | "off" | no 
| header_rules | Custom request header configuration rules. | any| {} | no 
| cache_key | Cache key configuration (Ignore Query String configuration). | any | {} | no 
| url_purge | List of url to purge. | list | [] | no 
| url_push | List of url to push. | list | [] | no 
## Outputs

| Name | Description |
|------|-------------|
| project_id | Project CDN belongs to. |
| cname | CNAME address of domain name. |
| create_time | Domain name creation time. |
| status | Acceleration service status. |


## Authors

Created and maintained by [TencentCloud](https://github.com/terraform-providers/terraform-provider-tencentcloud)

## License

Mozilla Public License Version 2.0.
See LICENSE for full details.
