
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
| region | TencentCloud region to launch resources. | string |  | no 
| domain | Name of the acceleration domain. | string | "" | no 
| service_type | Service type of acceleration domain name. | string | ""  | no 
| https_switch | HTTPS configuration switch. | string| "off" | no |
| origin_type | Master origin server type.  | string| "" | no|
| origin_list | Master origin server list. Valid values can be ip or domain name. When modifying the origin server, you need to enter the corresponding `origin_type`.  | list(string)| [] | no |

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
