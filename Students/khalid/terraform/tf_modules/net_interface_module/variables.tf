
variable "name" {
  description = "Name of the network interface to create."
  type        = string
}

variable "resource_group_name" {
  description = ""
  type        = string
}

variable "location" {
  description = ""
  type        = string
}

variable "ip_name" {
  description = "ip configuration name of the network interface"
  type        = string
}

variable "subnet_id" {
  description = ""
  type        = string
}

variable "private_ip_address_allocation" {
  description = ""
  type        = string
}

variable "public_ip_address_id" {
  description = ""
  type        = string
}

