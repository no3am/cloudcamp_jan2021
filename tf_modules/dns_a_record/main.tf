resource "azurerm_dns_a_record" "dns_a_record" {
  name                = var.dns_a_record_name
  resource_group_name = var.rg_name
  ttl                 = 0
  zone_name           = var.dns_zone_name
}