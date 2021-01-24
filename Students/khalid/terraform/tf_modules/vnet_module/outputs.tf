
output "vnet_address_space" {
  description   = "The address space of the newly created vNet"
  value         = azurerm_virtual_network.kwk_network.address_space
}

output "vnet_id" {
  description = "The id of the newly created vNet"
  value        = azurerm_virtual_network.kwk_network.id
}

output "vnet_location" {
  description = "The name of the resource group"
  value        = azurerm_virtual_network.kwk_network.location
}
output "vnet_name" {
  description = "The Name of the newly created vNet"
  value        = azurerm_virtual_network.kwk_network.name
}

output "vnet_subnets" {
  description = "The ids of subnets created inside the newl vNet"
  value        = azurerm_virtual_network.kwk_network.subnet
}