
variable "vnet_name" {
  description = "Name of the vnet to create."
  type        = string
}

variable "address_space" {
  description = "The address space that is used by the virtual network."
  type        = string
}

variable "resource_group_name" {
  description = "The name of an existing resource group to be imported."
  type        = string
}

variable "location" {
  description = "the location of virtual network"
  type        = string
}