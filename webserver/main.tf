provider "azurerm" {
  version = "=2.41.0"
  features {}
}

module "rg" {
  source   = "../tf_modules/rg_module"
  rg_name  = var.rg_name
  location = var.location
}

module "vnet" {
  source       = "../tf_modules/vnet_module"
  rg_name      = module.rg.rg_name
  location     = module.rg.rg_location
  cidr_address = var.cidr_address
}

module "subnet" {
  source           = "../tf_modules/subnet_module"
  rg_name          = module.rg.rg_name
  subnet_name      = "internal"
  vnet_name        = module.vnet.vnet_name
  address_prefixes = var.address_prefixes
}

module "public_ip" {
  source         = "../tf_modules/public_ip_module"
  rg_name        = module.rg.rg_name
  location       = module.rg.rg_location
  public_ip_name = "pubip"
}

module "nic" {
  source         = "../tf_modules/network_interface_module"
  rg_name        = module.rg.rg_name
  location       = module.rg.rg_location
  subnet_id      = module.subnet.subnet_id
  ip_config_name = "mynic"
  public_ip_id   = module.public_ip.ip_id
}

module "nsg" {
  source   = "../tf_modules/nsg_module"
  rg_name  = module.rg.rg_name
  location = module.rg.rg_location
  nsg_name = "naimnsg"
}

resource "azurerm_subnet_network_security_group_association" "subnet_to_nsg" {
  network_security_group_id = module.nsg.nsg_id
  subnet_id                 = module.subnet.subnet_id
}

module "vm" {
  source         = "../tf_modules/virtual_machine_module"
  rg_name        = module.rg.rg_name
  location       = module.rg.rg_location
  nic_id         = module.nic.nic_id
  vm_name        = "naim-webserver"
  admin_username = "devops"
}