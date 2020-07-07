variable "region" {
  description = "TencentCloud region to launch resources."
  type        = string
  default     = ""
}

variable "tags" {
  description = "A map of tags to add to all resources."
  type        = map(string)
  default     = {}
}

variable "domain" {
  description = "Name of the acceleration domain."
  type        = string
  default     = ""
}

variable "project_id" {
  description = "Project CDN belongs to."
  type        = number
  default     = 0
}

variable "service_type" {
  description = "Service type of acceleration domain name."
  type        = string
  default     = ""
}

variable "area" {
  description = "Acceleration region."
  default     = "mainland"
}

variable "full_url_cache" {
  description = "Whether to enable full-path cache."
  type        = bool
  default     = true
}

variable "origin" {
  description = "Origin server configuration."
  type        = object({
    origin_type          = string
    origin_list          = list(string)
    server_name          = string
    cos_private_access   = string
    origin_pull_protocol = string
  })
  default     = {
    origin_type          = ""
    origin_list          = []
    server_name          = ""
    cos_private_access   = "off"
    origin_pull_protocol = "http"
  }
}

variable "https_config" {
  description = "HTTPS acceleration configuration."
  type        = object({
    https_switch         = string
    http2_switch         = string
    ocsp_stapling_switch = string
    spdy_switch          = string
    verify_client        = string
  })
  default     = {
    https_switch         = "off"
    http2_switch         = "off"
    ocsp_stapling_switch = "off"
    spdy_switch          = "off"
    verify_client        = "off"
  }

}