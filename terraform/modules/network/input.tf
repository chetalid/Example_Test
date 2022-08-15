# Resource Group
variable "resource_group" {
    default = "azuredevops"
}
variable "location" {
    default = "East US"
}
# Network
variable "virtual_network_name" {
    default = "quality-releases-vnet"
}
variable "address_space" {
    default = ["10.5.0.0/16"]
}
variable "application_type" {
    default = "AppService"
}
variable "resource_type" {
    default = "quality-releases"
}
variable "address_prefix_test" {
    default = "10.5.1.0/24"
}

