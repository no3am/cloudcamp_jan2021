variable "name" {
  description = "the name of the subnet"
  type        = string
}

variable "resource_group_name" {
  description = "A mapping of tags to assign to the resource."
  type        = string
}

variable "virtual_network_name" {
  description = "A mapping of tags to assign to the resource."
  type        = string
}

variable "address_prefix" {
  description = "The address prefix to use for the subnet."
  type        = list(string)
}
