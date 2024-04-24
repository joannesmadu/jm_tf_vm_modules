module "virtual_machine" {
  source         = "./modules/vm"
  virtual_machine_name = var.vm_name
  network_interface_name = var.network_interface_name
  virtual_network_name = var.virtual_network_name
  subnet_name = var.subnet_name
  resource_group = var.vm_resource_group
  location       = var.vm_location
  env = var.env
  user = var.user
  ip_configuration = var.ip_configuration
  private_ip_address = var.private_ip_address
}
