output "vm_public_ip" {
  value = azurerm_public_ip.public_ip_address
}

output "vm_private_ip" {
  value = azurerm_network_interface.network_interface.private_ip_address
}