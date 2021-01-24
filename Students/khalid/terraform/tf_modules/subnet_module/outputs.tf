output "address_prefix" {
  description = "The address prefix for the subnet."
  value       = azurerm_subnet.kwk_subnet.address_prefix
}

output "id" {
  description = "The subnet ID."
  value       = azurerm_subnet.kwk_subnet.id
}

//output "ip_configurations" {
//  description = "The collection of IP Configurations with IPs within this subnet."
//  value       = azurerm_subnet.kwk_subnet.connection
//}

output "name" {
  description = "The name of the subnet."
  value       = azurerm_subnet.kwk_subnet.name
}

output "resource_group_name" {
  description = "The name of the resource group in which the subnet is created in."
  value       = azurerm_subnet.kwk_subnet.resource_group_name
}

output "virtual_network_name" {
  description = "The name of the virtual network in which the subnet is created in."
  value       = azurerm_subnet.kwk_subnet.virtual_network_name
}
