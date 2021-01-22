output "vnet_name" {
  description = "The name of the virtual network."
  value       = azurerm_virtual_network.main.name
}

output "vnet_id" {
  description = "The virtual NetworkConfiguration ID."
  value       = azurerm_virtual_network.main.id
}

output "vnet_address" {
  description = "The list of address spaces used by the virtual network."
  value       = azurerm_virtual_network.main.address_space
}