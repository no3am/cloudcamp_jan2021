resource "azurerm_linux_virtual_machine" "vm" {
  admin_username        = var.admin_username
  location              = var.location
  name                  = var.vm_name
  network_interface_ids = [var.nic_id]
  resource_group_name   = var.rg_name
  size                  = var.vm_size
  os_disk {
    caching = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "18.04-LTS"
    version   = "latest"
  }

  disable_password_authentication = true

  # TODO: get value from remote location
  custom_data = filebase64(pathexpand("/Users/naimsalameh/cloudcamp_jan2021/Assignments/Infrastructure/templates/cloudconfig.tpl"))

  admin_ssh_key {
    username   = var.admin_username
    # TODO: key should be stored in azure keyvaule
    public_key = file("~/.ssh/id_rsa.pub")
  }
}