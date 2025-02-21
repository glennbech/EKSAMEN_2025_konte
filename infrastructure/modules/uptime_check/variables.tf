variable "name" {}
variable "address" {}
variable "tags" {
  type    = list(string)
  default = ["production"]
}
