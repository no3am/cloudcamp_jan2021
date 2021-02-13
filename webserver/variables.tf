variable "location" {
  description = "(Required) The Azure Region where the Resource Group should exist. Changing this forces a new Resource Group to be created."
  type        = string
}

variable "rg_name" {
  description = "(Required) The Name which should be used for this Resource Group. Changing this forces a new Resource Group to be created."
  type        = string
}

variable "cidr_address" {
  description = "(Required) The address space that is used the virtual network. You can supply more than one address space."
  type        = list
}

variable "address_prefixes" {
  description = "(Optional) The address prefixes to use for the subnet."
}

variable "lb_name" {
  description = "(Required) Specifies the name of the Load Balancer."
  type        = string
}

variable "probe_name" {
  description = "(Required) Specifies the name of the Probe."
  type        = string
}

variable "probe_port" {
  description = "(Required) Port on which the Probe queries the backend endpoint. Possible values range from 1 to 65535, inclusive."
  type        = number
}

variable "ip_config_name" {
  description = "(Required) A name used for this IP Configuration."
  type        = string
}

variable "dns_zone_name" {
  description = "(Required) The name of the DNS Zone. Must be a valid domain name."
  type        = string
}