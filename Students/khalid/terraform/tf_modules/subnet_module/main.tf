resource "azurerm_subnet" "kwk_subnet" {
  name                  = var.name
  resource_group_name   = var.resource_group_name
  virtual_network_name  = var.virtual_network_name
  address_prefixes      = var.address_prefix
}