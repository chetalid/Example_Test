# Resource Group/Location
variable "location" {}
variable "resource_group" {}

variable "application_type" {
    default = "web"
}
variable "resource_type" {
    default = "pubIP"
}
