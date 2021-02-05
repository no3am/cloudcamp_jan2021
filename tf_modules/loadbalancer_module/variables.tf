variable "location" {
  description = "(Required) The Azure Region where the Resource Group should exist. Changing this forces a new Resource Group to be created."
  type        = string
}

variable "rg_name" {
  description = "(Required) The Name which should be used for this Resource Group. Changing this forces a new Resource Group to be created."
  type        = string
}

variable "lb_name" {
  description = "(Required) Specifies the name of the Load Balancer."
  type        = string
}

variable "pip_name" {
  description = "(Required) Specifies the name of the frontend ip configuration."
  type        = string
}

variable "pip_id" {
  description = "(Optional) The ID of a Public IP Address which should be associated with the Load Balancer."
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
  description = "(Required) The Name of the IP Configuration within the Network Interface which should be connected to the Backend Address Pool. Changing this forces a new resource to be created."
  type        = string
}

variable "nic_id" {
  description = "(Required) The ID of the NIC"
  type        = string
}