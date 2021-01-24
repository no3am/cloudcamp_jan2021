resource "azurerm_virtual_network" "kwk_network" {
  name                  = var.vnet_name
  address_space         = [var.address_space]
  resource_group_name   = var.resource_group_name
  location              = var.location
}