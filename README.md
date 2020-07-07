
# TencentCloud CDN  Module for Terraform

## terraform-tencentcloud-cdn

A terraform module used to create CDN and CDN domain.

The following resources are included.

* [CDN domain](https://www.terraform.io/docs/providers/tencentcloud/r/cdn_domain.html)

## Usage
```hcl
module "cdn" {
  source = "terraform-tencentcloud-modules/cdn/tencentcloud"
  region = var.region

  project_id     = 0
  domain         = "test.zhaoshaona.com"
  service_type   = "web"
  area           = "mainland"
  full_url_cache = false
  origin         = {
    origin_type          = "ip"
    origin_list          = ["172.199.199.130"]
    server_name          = "test.zhaoshaona.com"
    cos_private_access   = "off"
    origin_pull_protocol = "http"
    backup_origin_type   = "ip"
  }

  https_config = {
    https_switch         = "off"
    http2_switch         = "off"
    ocsp_stapling_switch = "off"
    spdy_switch          = "off"
    verify_client        = "on"
  }

}
```

## Conditional Creation

This module can create CDN and CDN domain.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| region | TencentCloud region to launch resources. | string | "" | no 
| service_type | Service type of acceleration domain name. | string | ""  | no 
| full_url_cache | Whether to enable full-path cache. | bool | true | no 
| origin | Origin server configuration. | object | {} | no 
| https_config | HTTPS acceleration configuration. | object | {} | no 
| tags | A map of tags to add to all resources. | map(string) | {} | no 
| domain | Name of the acceleration domain. | string | "" | no 
| project_id | Project CDN belongs to. | number | 0 | no 
| area | Acceleration region. | string | "mainland" | no 

### https_config

`https_config` is HTTPS acceleration configuration, folling name are defined.

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
|https_switch| HTTPS configuration switch. | string| "off" | no |
|http2_switch| HTTP2 configuration switch.  | string| "off" | no |
|ocsp_stapling_switch| OCSP configuration switch. | string| "off" | no |
|spdy_switch|  Spdy configuration switch.  | string| "off" | no |
|verify_client| Client certificate authentication feature. | string| "off" | no |

### origin
`origin` is Origin server configuration, folling name are defined.

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
|origin_type| Master origin server type.  | string| "" | no|
|origin_list| Master origin server list. Valid values can be ip or domain name. When modifying the origin server, you need to enter the corresponding `origin_type`.  | list(string)| [] | no |
|server_name| Host header used when accessing the master origin server. If left empty, the acceleration domain name will be used by default. | string| "" | no |
|cos_private_access| When OriginType is COS, you can specify if access to private buckets is allowed. | string| "off" | no |
|origin_pull_protocol| Origin-pull protocol configuration.   | string| "http" | no |

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
