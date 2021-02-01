resource "azurerm_network_interface" "nic" {
  name                = "${var.rg_name}-nic"
  location            = var.location
  resource_group_name = var.rg_name

  ip_configuration {
    name                          = var.ip_config_name
    subnet_id                     = var.subnet_id
    private_ip_address_allocation = var.p_ip_address_allocation
    public_ip_address_id          = var.public_ip_id
  }
}