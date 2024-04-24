resource "azurerm_resource_group" "resource_group" {
  name     = var.resource_group
  location = var.location
}

resource "azurerm_virtual_network" "virtual_network" {
  name                = var.virtual_network_name
  address_space       = var.address_space
  location            = azurerm_resource_group.resource_group.location
  resource_group_name = azurerm_resource_group.resource_group.name
}

resource "azurerm_subnet" "internal" {
  name                 = var.subnet_name
  resource_group_name  = azurerm_resource_group.resource_group.name
  virtual_network_name = azurerm_virtual_network.virtual_network.name
  address_prefixes     = var.address_prefixes
}

resource "azurerm_network_interface" "network_interface" {
  name                = var.network_interface_name
  location            = azurerm_resource_group.resource_group.location
  resource_group_name = azurerm_resource_group.resource_group.name

  ip_configuration {
    name                          = var.ip_configuration
    subnet_id                     = azurerm_subnet.internal.id
    private_ip_address_allocation = var.private_ip_address_allocation
  }
}

resource "azurerm_virtual_machine" "virtual_machine" {
  name                  = var.virtual_machine_name
  location              = azurerm_resource_group.resource_group.location
  resource_group_name   = azurerm_resource_group.resource_group.name
  network_interface_ids = [azurerm_network_interface.network_interface.id]
  vm_size               = var.vm_size

  # Uncomment this line to delete the OS disk automatically when deleting the VM
  # delete_os_disk_on_termination = true

  # Uncomment this line to delete the data disks automatically when deleting the VM
  # delete_data_disks_on_termination = true

  # storage_image_reference {
  #   publisher = "Canonical"
  #   offer     = "0001-com-ubuntu-server-jammy"
  #   sku       = "22_04-lts"
  #   version   = "latest"
  # }
  storage_os_disk {
    name              = var.os_disk_name
    create_option     = var.os_disk_create_option
  }
  # os_profile {
  #   computer_name  = "hostname"
  #   admin_username = "testadmin"
  #   admin_password = "Password1234!"
  # }
  os_profile_linux_config {
    disable_password_authentication = false
  }
  tags = {
    environment = local.env
  }
}

resource "azurerm_public_ip" "public_ip_address" {
  name                = var.public_ip_name
  resource_group_name = azurerm_resource_group.resource_group.name
  location            = azurerm_resource_group.resource_group.location
  allocation_method   = var.public_ip_allocation_method

  tags = {
    environment = local.env
  }
}

#for the tags
locals {
  user = var.user
  env = var.env
  cohort = format("ce%02d", var.cohort)
  vm_name   = format("%s-%s", local.user, var.string)
}