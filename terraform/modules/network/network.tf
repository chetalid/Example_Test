resource "azurerm_virtual_network" "test" {
  name                 = "web-${var.application_type}-${var.resource_type}"
  address_space        = "${var.address_space}"
  location             = "${var.location}"
  resource_group_name  = "${var.resource_group}"
}
resource "azurerm_subnet" "test" {
  name                 = "web-${var.application_type}-${var.resource_type}-subnet1"
  resource_group_name  = "${var.resource_group}"
  virtual_network_name = "${azurerm_virtual_network.test.name}"
  address_prefixes     = ["10.5.1.0/24"]
}