variable "location" {
  description = "(Required) The Azure Region where the Resource Group should exist. Changing this forces a new Resource Group to be created."
  type        = string
}

variable "rg_name" {
  description = "(Required) The Name which should be used for this Resource Group. Changing this forces a new Resource Group to be created."
  type        = string
}

variable "nic_id" {
  description = "The NIC id"
  type        = string
}

variable "vm_size" {
  description = ""
  type = string
  default = "Standard_B1s"
}

variable "vm_name" {}
variable "admin_username" {}
variable "vm_password" {
  description = ""
  type        = string
  default     = "Password1234!"
}