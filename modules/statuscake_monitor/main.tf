terraform {
  required_providers {
    statuscake = {
      source  = "statuscakedev/statuscake"
      version = "2.2.2"
    }
  }
}
resource "statuscake_uptime_check" "monitor" {
  check_interval = var.check_interval
  confirmation   = var.confirmation
  name           = var.name
  trigger_rate   = var.trigger_rate


  http_check {
    timeout      = var.timeout
    validate_ssl = var.validate_ssl
    status_codes = var.status_codes
  }

  monitored_resource {
    address = var.target_url
  }

  tags = var.tags

  contact_groups = var.contact_group_ids

}