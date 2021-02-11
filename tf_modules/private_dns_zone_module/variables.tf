variable "dns_zone_name" {
  description = "(Required) The name of the DNS Zone. Must be a valid domain name."
  type        = string
}

variable "rg_name" {
  description = "(Required) The Name which should be used for this Resource Group. Changing this forces a new Resource Group to be created."
  type        = string
}