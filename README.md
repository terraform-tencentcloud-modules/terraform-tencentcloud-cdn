
# TencentCloud CDN  Module for Terraform

## terraform-tencentcloud-cdn

A terraform module used to create CDN domain.

The following resources are included.

* [CDN domain](https://www.terraform.io/docs/providers/tencentcloud/r/cdn_domain.html)

## Usage
```hcl
module "cdn" {
  source         = "terraform-tencentcloud-modules/cdn/tencentcloud"
  domain         = "test.zhaoshaona.com"
  service_type   = "web"
  https_switch   = "off"
  origin_type    = "ip"
  origin_list    = ["172.199.199.130"]
}
```

## Conditional Creation

This module can create CDN domain.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| domain | Name of the acceleration domain. | string | "" | yes 
| service_type | Service type of acceleration domain name. | string | ""  | yes 
| full_url_cache | Whether to enable full-path cache. | bool | true | no 
| area | Domain name acceleration region. | string | null | no 
| origin_type | Master origin server type.  | string| "" | yes|
| origin_list | Master origin server list. Valid values can be ip or domain name. When modifying the origin server, you need to enter the corresponding `origin_type`.  | list(string)| [] | yes |
| server_name | Host header used when accessing the master origin server. | string | null | no 
| cos_private_access | When OriginType is COS, you can specify if access to private buckets is allowed. | string | off | no 
| origin_pull_protocol | Origin-pull protocol configuration. | string | http | no 
| https_switch | HTTPS configuration switch. | string| "off" | no |
| http2_switch | HTTP2 configuration switch. | string | off | no 
| ocsp_stapling_switch | OCSP configuration switch. | string | off | no 
| spdy_switch | Spdy configuration switch. | string | off | no 
| verify_client | Client certificate authentication feature. | string | off | no 
| server_certificate_config | Server certificate configuration information. | list | [] | no 
| client_certificate_config | Client certificate configuration information. | list | [] | no 
| tags | Tags of cdn domain. | map | null | no 
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
