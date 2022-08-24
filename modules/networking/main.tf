resource "azurerm_virtual_network" "azure-vm" {
  name                = "${var.name}-vnet"
  location            = var.rg_location
  resource_group_name = var.rg_name
  address_space       = ["10.0.0.0/16"]
}

resource "azurerm_subnet" "subnet00" {
  name                 = "${var.name}-subnet00"
  resource_group_name  = var.rg_name
  virtual_network_name = azurerm_virtual_network.azure-vm.name
  address_prefixes     = ["10.0.1.0/24"]
}

resource "azurerm_subnet" "subnet01" {
  name                 = "${var.name}-subnet01"
  resource_group_name  = var.rg_name
  virtual_network_name = azurerm_virtual_network.azure-vm.name
  address_prefixes     = ["10.0.2.0/24"]
}

resource "azurerm_network_interface" "azure-nic" {
  name                = "${var.name}-network-interface"
  location            = var.rg_location
  resource_group_name = var.rg_name



  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.subnet00.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.example.id
  }
}

resource "azurerm_public_ip" "example" {
  name                = "${var.name}-pub_ip"
  resource_group_name = var.rg_name
  location            = var.rg_location
  allocation_method   = "Dynamic"

  tags = {
    environment = "Production"
  }
}