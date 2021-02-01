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
  source = "../tf_modules/vnet_module"
  rg_name = module.rg.rg_name
  location = module.rg.rg_location
  cidr_address = var.cidr_address
}

module "subnet" {
  source = "../tf_modules/subnet_module"
  rg_name = module.rg.rg_name
  subnet_name = "internal"
  vnet_name = module.vnet.vnet_name
  address_prefixes = var.address_prefixes
}

