# Azure GUIDS
variable "subscription_id" {
    default = "79f93199-ea71-4fc7-a0c1-a0f75c5ea7e1"
}
variable "client_id" {
    default = "cc696564-4afa-474a-8d3c-c41a8badaaaf"
}
variable "client_secret" {
    default = "tFoZxzMwom.L2xPSNE3Fy9zMn.YbWQA.m1"
}
variable "tenant_id" {
    default = "e9164a2c-aad6-42f3-8414-2ce4840890e9"
}
variable "vm_admin_username" {
    default = "azureuser"
}

# Network
variable "subnet_id" {
    default = "/subscriptions/09b22bb3-8da4-418b-a14e-087a777b0654/resourceGroups/azuredevops/providers/Microsoft.Network/virtualNetworks/azuredevops-NET-subnet1"
}
variable "public_ip_address_id" {
    default = "/subscriptions/09b22bb3-8da4-418b-a14e-087a777b0654/resourceGroups/azuredevops/providers/Microsoft.Network/virtualNetworks/azuredevops-NET-subnet1"
}


# Resource Group/Location
variable "location" {
    default = "East US"
}
variable "application_type" {
    default = "AppService"
}
variable "resource_type" {
    default = "azure-appservice"
}
variable "resource_group" {
    default = "azuredevops"
}
variable "vm_size" {
    default = "Standard_B1s"
}
