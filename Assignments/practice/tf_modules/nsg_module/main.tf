resource "azurerm_network_security_group" "nsg" {
  location            = var.location
  name                = var.nsg_name
  resource_group_name = var.rg_name

  # TODO these shouldn't be hardcoded
  security_rule {
    name                       = "ssh"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = "85.250.66.151"
    destination_address_prefix = "*"
  }

}