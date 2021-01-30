resource "azurerm_virtual_network" "vnet" {
  address_space       = var.cidr_address
  location            = var.location
  name                = "${var.rg_name}-vnet"
  resource_group_name = var.rg_name
}