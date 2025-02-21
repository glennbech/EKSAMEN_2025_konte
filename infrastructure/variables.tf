variable "check_interval" {
  default = 300
}

variable "confirmation" {
  default = 3
}

variable "name" {
  default = "website_monitor-site"
}

variable "trigger_rate" {
  default = 10
}

variable "timeout" {
  default = 20
}

variable "validate_ssl" {
  default = true
}

variable "status_codes" {
  type    = list(string)
  default = ["200"]
}

variable "address" {
  default = "https://www.vg.no"
}

variable "tags" {
  type    = list(string)
  default = ["production"]
}