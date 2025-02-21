terraform {
  required_providers {
    statuscake = {
      source  = "StatusCakeDev/statuscake"
      version = "2.2.2"
    }
  }
}
resource "statuscake_uptime_check" "this" {
  name           = var.name
  check_interval = 300
  confirmation   = 3
  trigger_rate   = 10

  http_check {
    timeout      = 20
    validate_ssl = true
    status_codes = ["200"]
  }

  monitored_resource {
    address = var.address
  }
  tags = var.tags
}
