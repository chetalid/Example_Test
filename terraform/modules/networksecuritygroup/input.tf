# Resource Group/Location
variable "subnet_id" {}
variable "address_prefix_test" {}


variable "resource_group" {
    default = "azuredevops"
}
variable "location" {
    default = "East US"
}

variable "application_type" {
    default = "web"
}
variable "resource_type" {
    default = "nsg"
}