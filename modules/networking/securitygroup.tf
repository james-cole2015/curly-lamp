resource "azurerm_network_security_group" "ssh_access" {
  name                = "${var.name}-sg"
  location            = var.rg_location
  resource_group_name = var.rg_name

  security_rule {
    name                       = "SSH"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

  tags = {
    environment = "Production"
  }
}

resource "azurerm_network_interface_security_group_association" "sg-linuxvm" {
  network_interface_id      = azurerm_network_interface.azure-nic.id
  network_security_group_id = azurerm_network_security_group.ssh_access.id
}