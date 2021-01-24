
output "vmc_name" {
  description = "The id of the newly created vNet"
  value        = azurerm_virtual_machine.kwk_vm.name
}

output "vmc_id" {
  description = "The name of the resource group"
  value        = azurerm_virtual_machine.kwk_vm.id
}
