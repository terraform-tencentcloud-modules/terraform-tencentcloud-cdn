/*
* base_config
*/
variable "region" {
  description = "TencentCloud region to launch resources."
  type        = string
  default     = ""
}

variable "domain" {
  description = "Name of the acceleration domain."
  type        = string
  default     = ""
}

variable "service_type" {
  description = "Service type of acceleration domain name."
  type        = string
  default     = ""
}

variable "area" {
  description = "Domain name acceleration region."
  type        = string
  default     = "mainland"
}

variable "follow_redirect_switch" {
  description = "301/302 redirect following switch."
  type        = string
  default     = "off"
}

variable "range_origin_switch" {
  description = "Sharding back to source configuration switch."
  type        = string
  default     = "on"
}

variable "tags" {
  description = "A map of tags to add to all resources."
  type        = map(string)
  default     = {}
}

/*
* origin_config
*/
variable "origin_type" {
  description = "Master origin server type."
  type        = string
  default     = ""
}

variable "origin_list" {
  description = "Master origin server list."
  type        = list(string)
  default     = []
}

variable "origin_pull_protocol" {
  description = "Origin-pull protocol configuration."
  type        = string
  default     = "follow"
}

variable "cos_private_access" {
  description = "When OriginType is COS, you can specify if access to private buckets is allowed."
  type        = string
  default     = "off"
}

/*
* https_config
*/
variable "https_switch" {
  description = "HTTPS configuration switch."
  type        = string
  default     = "off"
}

variable "http2_switch" {
  description = "HTTP2 configuration switch."
  type        = string
  default     = "off"
}

variable "ocsp_stapling_switch" {
  description = "OCSP configuration switch."
  type        = string
  default     = "off"
}

variable "spdy_switch" {
  description = "Spdy configuration switch.This parameter is for white-list customer."
  type        = string
  default     = "off"
}

variable "verify_client" {
  description = "Client certificate authentication feature."
  type        = string
  default     = "off"
}

variable "force_redirect" {
  description = "Configuration of forced HTTP or HTTPS redirects."
  type        = any
  default     = {}
}

/*
* request_config
*/
variable "request_switch" {
  description = "Custom request header configuration switch."
  type        = string
  default     = "off"
}

variable "header_rules" {
  description = "Custom request header configuration rules."
  type        = any
  default     = {}
}

/*
* cache_config
*/
variable "cache_key" {
  description = "Cache key configuration (Ignore Query String configuration)"
  type        = any
  default     = {}
}

/*
* url_purge
*/
variable "url_purge" {
  description = "List of url to purge."
  type        = list(string)
  default     = []
}

/*
* url_push
*/
variable "url_push" {
  description = "List of url to push."
  type        = list(string)
  default     = []
}
