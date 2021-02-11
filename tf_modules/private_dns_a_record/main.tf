resource "azurerm_private_dns_a_record" "dns_a_record" {
  resource_group_name = var.rg_name
  name = var.dns_a_record_name
  ttl = 300
  zone_name = var.dns_zone_name
  records = var.record
}