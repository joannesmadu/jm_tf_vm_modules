variable "resource_group" {
  type        = string
  description = "The resource group where the VNET will be created"
}

variable "virtual_network_name" {
  type        = string
  description = "The name for the virtual network"
}

variable "location" {
  type        = string
  description = "The location/region where we will create the VM"
  default     = "North Europe"
}

variable "address_space" {
  type        = list(string)
  description = "One or more CIDR ranges that we want our VNET to allow for IPs"
  default     = ["10.0.0.0/16"]
}

variable "address_prefixes" {
  type        = list(string)
  description = "One or more CIDR ranges that we want our VNET to allow for IPs"
  default     = ["10.0.2.0/24"]
}

variable "subnet_name" {
  type        = string
  description = "The name of the subnet"
}

variable "network_interface_name" {
  type        = string
  description = "The name of the network interface"
}

variable "virtual_machine_name" {
  type        = string
  description = "The name of the network interface"
}

variable "vm_size" {
  type = string
  description = "The size of the virtual machine"
  default = "Standard_DS1_v2"
}

variable "private_ip_address" {
  type = string
  description = "Private IP for VM"
}

variable "ip_configuration" {
  type = string
  description = "Name of the IP configuration for network interface for VM"
}

variable "private_ip_address_allocation" {
  type = string
  default = "Dynamic"
}

variable "os_disk_name" {
  type = string
  default = "osdisk1"
}

variable "os_disk_create_option" {
  type = string
  default = "FromImage"
}

variable "public_ip_name" {
  type = string
  default = "public_ip1"
}

variable "public_ip_allocation_method" {
  type = string
  default = "Static"
}

variable "cohort" {
  type = number
}

variable "user" {
  type = string
}

variable "env" {
  type = string
}

variable "string" {
  type = string
  default = "A1B2C3"
}