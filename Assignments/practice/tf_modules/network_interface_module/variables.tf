variable "location" {
  description = "(Required) The Azure Region where the Resource Group should exist. Changing this forces a new Resource Group to be created."
  type        = string
}

variable "rg_name" {
  description = "(Required) The Name which should be used for this Resource Group. Changing this forces a new Resource Group to be created."
  type        = string
}

variable "ip_config_name" {
  description = "(Required) A name used for this IP Configuration."
  type        = string
}

variable "subnet_id" {
  description = "(Optional) The ID of the Subnet where this Network Interface should be located in."
  type        = string
}

variable "p_ip_address_allocation" {
  description = "(Required) The allocation method used for the Private IP Address. Possible values are Dynamic and Static."
  type        = string
  default     = "Dynamic"
}

variable "public_ip_id" {
  description = "(Optional) Reference to a Public IP Address to associate with this NIC"
  type        = string
}