variable "dns_zone_name" {
  description = "(Required) The name of the DNS Zone. Must be a valid domain name."
  type        = string
}

variable "rg_name" {
  description = "(Required) The Name which should be used for this Resource Group. Changing this forces a new Resource Group to be created."
  type        = string
}

variable "dns_a_record_name" {
  description = "(Required) The name of the DNS A Record."
  type        = string
}

variable "a_record" {
  description = "(Optional) List of IPv4 Addresses. Conflicts with target_resource_id."
  type        = list
}