output "subnet_name" {
  description = "The subnet name"
  value       = azurerm_subnet.subnet.name
}

output "subnet_id" {
  description = "The subnet ID"
  value = azurerm_subnet.subnet.id
}