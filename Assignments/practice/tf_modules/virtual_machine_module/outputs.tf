output "vm_name" {
  description = "The VM name"
  value       = azurerm_linux_virtual_machine.vm.name
}

output "vm_id" {
  description = "The VM ID"
  value       = azurerm_linux_virtual_machine.vm.id
}