variable "rg_name" {
  description = "(Required) The Name which should be used for this Resource Group. Changing this forces a new Resource Group to be created."
  type        = string
}

variable "subnet_name" {
  description = "(Required) The name of the subnet. Changing this forces a new resource to be created."
  type        = string
}

variable "vnet_name" {
  description = "(Required) The name of the virtual network to which to attach the subnet. Changing this forces a new resource to be created."
  type        = string
}

variable "address_prefixes" {
  description = "(Optional) The address prefixes to use for the subnet."
}