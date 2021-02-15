output "vnet_name" {
  description = "The name of the virtual network."
  value       = azurerm_virtual_network.vnet.name
}

output "vnet_id" {
  description = "The virtual NetworkConfiguration ID."
  value       = azurerm_virtual_network.vnet.id
}

output "vnet_address" {
  description = "The list of address spaces used by the virtual network."
  value       = azurerm_virtual_network.vnet.address_space
}