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
}

module "loadbalancer" {
  source       = "../tf_modules/loadbalancer_module"
  rg_name      = module.rg.rg_name
  location     = module.rg.rg_location
  lb_name      = var.lb_name
  pip_name     = module.public_ip.ip_name
  pip_id       = module.public_ip.ip_id
  backend_name = var.backend_name
  probe_name   = var.probe_name
  probe_port   = var.probe_port
//  vnet_id      = module.subnet.subnet_id
//  nic_ip       = module.nic.nic_private_ip
}

module "nsg" {
  source                = "../tf_modules/nsg_module"
  rg_name               = module.rg.rg_name
  location              = module.rg.rg_location
  nsg_name              = "naimnsg"
  source_address_prefix = "85.250.66.151"
}

resource "azurerm_subnet_network_security_group_association" "subnet_to_nsg" {
  network_security_group_id = module.nsg.nsg_id
  subnet_id                 = module.subnet.subnet_id
}

resource "random_password" "vm_password" {
  length = 14
  special = true
  override_special = "_%@"
}

module "vm" {
  source         = "../tf_modules/virtual_machine_module"
  rg_name        = module.rg.rg_name
  location       = module.rg.rg_location
  nic_id         = module.nic.nic_id
  vm_name        = "naim-webserver"
  admin_username = "devops"
  vm_password    = random_password.vm_password.result
  custom_data    = filebase64(pathexpand("/Users/naimsalameh/cloudcamp_jan2021/cloud_init_templates/cloudconfig_httpd.tpl"))
}