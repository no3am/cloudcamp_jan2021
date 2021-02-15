output "rg_name" {
  description = "The name of the resource group"
  value       = azurerm_resource_group.resource_group.name
}

output "rg_location" {
  description = "The location of the resource group"
  value       = azurerm_resource_group.resource_group.location
}