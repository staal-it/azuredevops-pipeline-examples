resource "azurerm_resource_group" "example" {
  name     = local.storage_account_name
  location = "West Europe"
}

resource "azurerm_virtual_network" "example" {
  name                = "virtualNetwork"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
  address_space       = [local.vnet_address_space]
}