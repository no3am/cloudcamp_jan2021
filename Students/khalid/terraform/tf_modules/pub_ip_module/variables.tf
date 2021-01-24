
variable "sku" {
  description = "The SKU of the Public IP. Accepted values are Basic and Standard. Defaults to Basic."
  type = string
}

variable "location" {
  description = "Location of the public IP to be created"
  type = string
}

variable "name" {
  description = "Name of the public IP to be created"
  type = string
}

variable "resource_group_name" {
  description = "Resource group of the public IP to be created"
  type = string
}

variable "allocation_method" {
  description = "Defines the allocation method for this IP address. Possible values are Static or Dynamic."
  type = string
}

//variable "convention" {
//  description = "Naming convention method to use"
//  type        = string
//}
//variable "diagnostics_map" {
//  description = "Storage account and Event Hub for the IP address diagnostics"
//  type = string
//}
//variable "diagnostics_settings" {
//  description = "Map with the diagnostics settings for public IP deployment"
//  type = string
//}
//variable "log_analytics_workspace_id" {
//  description = "Log Analytics ID for the IP address diagnostics"
//  type = string
//}
