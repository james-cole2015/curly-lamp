output "vnet-info" {
  value = azurerm_virtual_network.azure-vm
}

output "network-interface" {
  value = azurerm_network_interface.azure-nic
}

output "subnet00" {
  value = azurerm_subnet.subnet00
}

output "subnet01" {
  value = azurerm_subnet.subnet01
}