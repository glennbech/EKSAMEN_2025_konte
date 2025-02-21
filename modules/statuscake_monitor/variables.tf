variable "name" {
  description = "Navn på monitoren"
  type        = string
}

variable "target_url" {
  description = "Nettsiden som skal overvåkes"
  type        = string
}

variable "check_interval" {
  description = "Intervallet i sekunder mellom sjekker"
  type        = number
  default     = 300
}

variable "confirmation" {
  description = "Antall bekreftelser før alarm"
  type        = number
  default     = 3
}

variable "trigger_rate" {
  description = "Alarm trigger rate"
  type        = number
  default     = 10
}

variable "timeout" {
  description = "Timeout for http-sjekken"
  type        = number
  default     = 20
}

variable "validate_ssl" {
  description = "Valider SSL for http-sjekken"
  type        = bool
  default     = true
}

variable "status_codes" {
  description = "Liste over gyldige HTTP-statuskoder"
  type        = list(string)
  default     = ["200"]
}

variable "tags" {
  description = "Liste over tags for monitoren"
  type        = list(string)
  default     = ["production"]
}

variable "contact_group_ids" {
  description = "Liste over konktakt gruppe ider "
  type        = list(string)
  default     = []
}