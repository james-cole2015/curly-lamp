resource "random_pet" "azure" {
}

resource "random_integer" "priority" {
  min = 10000
  max = 500000
}

resource "azurerm_resource_group" "rg" {
  name     = "${random_pet.azure.id}-rg"
  location = "eastus"
}

module "networking" {
  source      = "./modules/networking"
  rg_location = azurerm_resource_group.rg.location
  name        = random_pet.azure.id
  rg_name     = azurerm_resource_group.rg.name
}

module "linux_vm" {
  source            = "./modules/linux_vm"
  rg_location       = azurerm_resource_group.rg.location
  name              = random_pet.azure.id
  rg_name           = azurerm_resource_group.rg.name
  network_interface = module.networking.network-interface.id
}