resource "azurerm_storage_account" "storage_account" {
  account_replication_type = var.account_replication_type
  account_tier             = var.account_tier
  location                 = var.location
  name                     = var.storage_account_name
  resource_group_name      = var.rg_name
}