variable "location" {
  description   = "bla blaa bala"
  type          = string
}

variable "ip_address" {
  description   = "ip of the net"
  type          = string
}

variable "allocation_method" {
  description   = "the allocation method for this IP address"
  type          = string
}

variable "sku" {
  description   = "the sku for this IP address"
  type          = string
}

variable "rg_name_hard" {
  description = ""
  type = string
  default =  "resource_group_kwk"
}
