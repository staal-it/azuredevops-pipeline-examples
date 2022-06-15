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

resource "azurerm_storage_account" "storage_account" {
  name                     = "stterdemov2"
  resource_group_name      = azurerm_resource_group.example.name
  location                 = azurerm_resource_group.example.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  account_kind             = "StorageV2"
  access_tier              = "Hot"
}