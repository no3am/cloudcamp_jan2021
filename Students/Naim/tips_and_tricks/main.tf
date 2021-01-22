provider "azurerm" {
  version = "=2.43"
  features {}
}

module "rg_module" {
  source   = "../tf_modules/rg_module"
  rg_name  = var.resource_group_name
  location = var.location
}

resource "azurerm_eventhub_namespace" "example" {
  count               = 3
  name                = "cloudcamp-ehn-${count.index}"
  location            = module.rg_module.rg_location
  resource_group_name = module.rg_module.rg_name
  sku                 = "Standard"
  capacity            = 1

  tags = {
    environment = "Production"
  }
}

resource "azurerm_eventhub" "example" {
  for_each            = toset(azurerm_eventhub_namespace.example.*.name)
  message_retention   = 1
  name                = "cloudcamp-topic"
  namespace_name      = each.value
  partition_count     = 2
  resource_group_name = module.rg_module.rg_name
}



