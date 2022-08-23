resource "azurerm_virtual_network" "azure-vm" {
    name = "${var.name}-vnet"
    location = var.rg_location
    resource_group_name = var.rg_name 
    address_space = ["10.0.0.0/16"]

    subnet {
        name = "${var.name}-subnet00"
        address_prefix = "10.0.1.0/24"
    }

    subnet {
        name = "${var.name}-subnet01"
        address_prefix = "10.0.2.0/24"
    }
}
