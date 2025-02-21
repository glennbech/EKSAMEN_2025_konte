terraform {
  required_providers {
    statuscake = {
      source = "StatusCakeDev/statuscake"
      version = "2.2.2"
    }
  }
}

resource "statuscake_uptime_check" "website_monitor" {
  check_interval = var.check_interval
  confirmation   = var.confirmation
  name           = var.name
  trigger_rate   = var.trigger_rate

  http_check {
    timeout          = var.timeout
    validate_ssl     = var.validate_ssl
    status_codes     = var.status_codes
  }

  monitored_resource {
    address = var.address
  }
  tags = var.tags
}
resource "random_id" "contact_group_suffix" {
  byte_length = 4
}

resource "statuscake_contact_group" "website_monitor" {
  name  = "website_monitor-group-${random_id.contact_group_suffix.hex}"
  email_addresses = ["fredrikravndalgaaso@gmail.com"]
}


module "site1" {
  source  = "./modules/uptime_check"
  name    = "site1"
  address = "https://www.vg.no"
}

module "site2" {
  source  = "./modules/uptime_check"
  name    = "site2"
  address = "https://xkcd.com"
}