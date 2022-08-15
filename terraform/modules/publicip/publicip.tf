resource "azurerm_public_ip" "test" {
  name                = "web-${var.application_type}-${var.resource_type}"
  location            = "${var.location}"
  resource_group_name = "${var.resource_group}"
  allocation_method   = "Dynamic"
}