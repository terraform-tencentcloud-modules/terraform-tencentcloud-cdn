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

variable "https_switch" {
  description = "HTTPS configuration switch."
  type        = string
  default     = "off"
}

variable "server_certificate_config" {
  description = "Server certificate configuration information."
  type        = list
  default     = []
}

variable "client_certificate_config" {
  description = "Client certificate configuration information."
  type        = list
  default     = []
}

variable "full_url_cache" {
  description = "Whether to enable full-path cache."
  type        = bool
  default     = true
}

variable "area" {
  description = "Domain name acceleration region."
  type        = string
  default     = null
}

variable "tags" {
  description = "Tags of cdn domain."
  type        = map(string)
  default     = null
}

variable "server_name" {
  description = "Host header used when accessing the master origin server."
  type        = string
  default     = null
}

variable "cos_private_access" {
  description = "When OriginType is COS, you can specify if access to private buckets is allowed."
  type        = string
  default     = "off"
}

variable "origin_pull_protocol" {
  description = "Origin-pull protocol configuration."
  type        = string
  default     = "http"
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
  description = "Spdy configuration switch."
  type        = string
  default     = "off"
}

variable "verify_client" {
  description = "Client certificate authentication feature."
  type        = string
  default     = "off"
}
