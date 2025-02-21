variable "name_uptime" {
  description = "The name of the uptime check"
}

variable "address_uptime" {
  description = "The address to be monitored by the uptime check"
}

variable "tags_uptime" {
  description = "Tags for the uptime check"
  type        = list(string)
}