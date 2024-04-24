# ROOT variables have every var for the resource we want to create

variable "vm_name" {
  type        = string
  description = "The name for the virtual machine"
}

variable "network_interface_name" {
  type        = string
  description = "The name for the network interface for the virtual machine"
}

variable "virtual_network_name" {
  type        = string
  description = "The name for the VNET for the virtual machine"
}

variable "subnet_name" {
  type        = string
  description = "The name for the subnet for the virtual machine"
}

variable "vm_resource_group" {
  type        = string
  description = "The resource group where the VM will be created"
}

variable "vm_location" {
  type        = string
  description = "The location/region where we will create the VM"
  default     = "North Europe"
}

variable "env" {
  type = string
}

variable "user" {
  type = string
}

variable "cohort" {
  type = number
}

variable "private_ip_address" {
  type = string
  description = "Private IP for VM"
}

variable "ip_configuration" {
  type = string
  description = "Name of the IP configuration for network interface for VM"
}