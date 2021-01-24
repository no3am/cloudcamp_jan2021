
variable "name" {
  description = "Name of the virtual machine to create."
  type        = string
}

variable "network_interface_ids" {
  description = "The network interface that is used by the virtual machine."
  type        = string
}

variable "resource_group_name" {
  description = "The name of an existing resource group to be imported."
  type        = string
}

variable "location" {
  description = "the location of virtual machine"
  type        = string
}

variable "vm_size" {
  description = "virtual machine size"
  type        = string
}

//variable "vm_count" {
//  description = "the number of virtual machines"
//  type        = number
//}

variable "delete_os_disk_on_termination" {
  description = "Uncomment this line to delete the OS disk automatically when deleting the VM"
  type        = bool
}

variable "delete_data_disks_on_termination" {
  description = "Uncomment this line to delete the data disks automatically when deleting the VM"
  type        = bool
}