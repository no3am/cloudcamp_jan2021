
output "id" {
  description = "The id of the newly created Network Interface"
  value        = azurerm_network_interface.kwk_net_interface.id
}

output "name" {
  description = "The name of the newly created Network Interfac"
  value        = azurerm_network_interface.kwk_net_interface.name
}
