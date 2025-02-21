variable "contact_group_name" {
  description = "Navn på kontaktgruppen"
  type        = string
  default     = "Standard Kontaktgruppe"
}

variable "contact_group_emails" {
  description = "Liste over e-postadresser for varsling"
  type        = list(string)
  default     = ["fredrikravndalgaaso@gmail.com"]
}
variable "statuscake_api_token" {
  description = "API-token for StatusCake"
  type        = string
  sensitive   = true
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
  default     = [200]
}