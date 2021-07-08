terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=1.0.0"
    }
  }
}
terraform {  
  backend "azurerm" {
    storage_account_name = "tstate1096"
    container_name       = "tstate"
    key                  = "terraform.tfstate"
  }
}
provider "azurerm" {
  tenant_id       = var.tenant_id
  subscription_id = var.subscription_id
  client_id       = var.client_id
  client_secret   = var.client_secret
  features {}
}
resource "azurerm_network_interface" "test" {
  name                = "${var.application_type}-${var.resource_type}-nic"
  location            = var.location
  resource_group_name = var.resource_group

  ip_configuration {
    name                          = "internal"
    subnet_id                     = "/subscriptions/79f93199-ea71-4fc7-a0c1-a0f75c5ea7e1/resourceGroups/quality-releases-rg/providers/Microsoft.Network/virtualNetworks/quality-releases-NET-subnet1"
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = "/subscriptions/79f93199-ea71-4fc7-a0c1-a0f75c5ea7e1/resourceGroups/quality-releases-rg/providers/Microsoft.Network/publicIPAddresses/quality-releases-publicip"
  }
}

resource "azurerm_linux_virtual_machine" "test" {
  name                = "${var.application_type}-${var.resource_type}"
  location            = var.location
  resource_group_name = var.resource_group
  size                = "Standard_B1s"
  admin_username      = var.vm_admin_username
  network_interface_ids = [azurerm_network_interface.test.id]
  admin_ssh_key {
    username   = var.vm_admin_username
    public_key = file("~/.ssh/id_rsa")
  }
  
  os_disk {
    caching = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }
  
  source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "16.04-LTS"
    version   = "latest"
  }
}
