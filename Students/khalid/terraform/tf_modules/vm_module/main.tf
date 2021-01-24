resource "azurerm_virtual_machine" "kwk_vm" {
  name                  = var.name
  location              = var.location
  resource_group_name   = var.resource_group_name
  network_interface_ids = [var.network_interface_ids]
  vm_size               = var.vm_size
  //count                 = var.vm_count

  # ==> Uncomment this line to delete the OS disk automatically when deleting the VM
  delete_os_disk_on_termination    = var.delete_os_disk_on_termination

  # ==> Uncomment this line to delete the data disks automatically when deleting the VM
  delete_data_disks_on_termination = var.delete_data_disks_on_termination

  storage_image_reference {
    publisher           = "Canonical"
    offer               = "UbuntuServer"
    sku                 = "16.04-LTS"
    version             = "latest"
  }
  storage_os_disk {
    name                = "myosdisk1"
    caching             = "ReadWrite"
    create_option       = "FromImage"
    managed_disk_type   = "Standard_LRS"
  }
  os_profile {
    computer_name       = "hostname"
    admin_username      = "devops"
    admin_password      = "Password1234!"
  }
  os_profile_linux_config {
    disable_password_authentication = false
  }
  tags = {
    environment         = "staging"
    terraform           = "terra"
  }
}
