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