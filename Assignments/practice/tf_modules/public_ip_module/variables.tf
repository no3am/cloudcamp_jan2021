variable "location" {
  description = "(Required) The Azure Region where the Resource Group should exist. Changing this forces a new Resource Group to be created."
  type        = string
}

variable "rg_name" {
  description = "(Required) The Name which should be used for this Resource Group. Changing this forces a new Resource Group to be created."
  type        = string
}

variable "public_ip_name" {
  description = "(Required) Specifies the name of the Public IP resource . Changing this forces a new resource to be created."
  type        = string
}

variable "allocation_method" {
  description = "(Required) Defines the allocation method for this IP address. Possible values are Static or Dynamic."
  type        = string
  default     = "Dynamic"
}