
/*
 * @auther : khalid khaskia
*/

# 2. The AzureRM provider in terraform
provider "azurerm" {
  //version = ">=2.17"  #"run it when terraform have a new version"
  features {}
}

# 3. Definning the Azure resource group kwkrg
module "rg_module" {
  source                           = "../terraform/tf_modules/rg_module"
  # rg_name does not requiered when giving the rg_name a default value in the rg_module/variable, same as location
  rg_name                          = var.rg_name_hard
  location                         = var.location
}

# 4. Definning a virtual network and subnet
module "vnet_module" {
  source                           = "../terraform/tf_modules/vnet_module"
  vnet_name                        = "${module.rg_module.rg_name}-vnet"
  address_space                    = var.ip_address
  location                         = var.location
  resource_group_name              = module.rg_module.rg_name
}
module "subnet_module" {
  source                           = "../terraform/tf_modules/subnet_module"
  name                             = "${module.rg_module.rg_name}-Subnet"
  resource_group_name              = module.rg_module.rg_name
  virtual_network_name             = module.vnet_module.vnet_name
  address_prefix                   = [var.ip_address]
}

# 5. Define a new public IP address
module "pub_ip_module"{
  source                           = "../terraform/tf_modules/pub_ip_module"
  allocation_method                = var.allocation_method
  location                         = var.location
  name                             = "${module.rg_module.rg_name}-public-ip"
  resource_group_name              = module.rg_module.rg_name
  sku                              = var.sku
}

# 6. Define a Network Interface for our VM
module "net_interface_module" {
  source                           = "../terraform/tf_modules/net_interface_module"
  name                             = "${module.rg_module.rg_name}-net-interface"
  location                         = module.rg_module.rg_location
  resource_group_name              = module.rg_module.rg_name

  // ip configuration
  ip_name                          = "ipconfig1"
  subnet_id                        = module.subnet_module.id
  private_ip_address_allocation    = "Dynamic"
  public_ip_address_id             = module.pub_ip_module.id
}

# 7. Define the Virtual Machine
/* UBUNTU LINUX */
module "vm_module"{
  source                           = "../terraform/tf_modules/vm_module"
  location                         = module.rg_module.rg_location
  name                             = "${module.rg_module.rg_name}-vm"
  network_interface_ids            = module.net_interface_module.id
  resource_group_name              = module.rg_module.rg_name
  //vm_count                         = 1
  vm_size                          = "Standard_DS1_v2"
  delete_data_disks_on_termination = true
  delete_os_disk_on_termination    = true
}

# 8. backend that manage the state file
//terraform {
//  backend "azurerm" {
//    resource_group_name            = "resource_group_kwk" # resource group name
//    storage_account_name           = "khalids"            # the name of the storage resource
//    container_name                 = "khalidc"            # the name of the container
//    key                            = "terraform.tfstate"  # terraform state file
//  }
//}

