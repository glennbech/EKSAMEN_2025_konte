terraform {
  required_providers {
    statuscake = {
      source  = "StatusCakeDev/statuscake"
      version = "2.2.2"
    }
  }
}

provider "statuscake" {
  api_token = var.statuscake_api_token
}

resource "statuscake_contact_group" "contact_group" {
  name            = var.contact_group_name
  email_addresses = var.contact_group_emails
}

module "monitor_vg" {
  source         = "../modules/statuscake_monitor"
  name           = "VG Monitor"
  target_url     = "www.vg.no"
  check_interval = var.check_interval
  confirmation   = var.confirmation
  trigger_rate   = var.trigger_rate
  timeout        = var.timeout
  validate_ssl   = var.validate_ssl
  status_codes   = var.status_codes
  tags           = ["production", "vg"]
  contact_group_ids  = [statuscake_contact_group.contact_group.id]

}

module "monitor_xkcd" {
  source         = "../modules/statuscake_monitor"
  name           = "xkcd Monitor"
  target_url     = "www.xkcd.com"
  check_interval = var.check_interval
  confirmation   = var.confirmation
  trigger_rate   = var.trigger_rate
  timeout        = var.timeout
  validate_ssl   = var.validate_ssl
  status_codes   = var.status_codes
  tags           = ["production", "xkcd"]
  contact_group_ids  = [statuscake_contact_group.contact_group.id]
}

output "monitor_vg_id" {
  value = module.monitor_vg.uptime_check_id
}

output "monitor_xkcd_id" {
  value = module.monitor_xkcd.uptime_check_id
}