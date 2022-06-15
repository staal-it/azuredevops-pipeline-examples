terraform {
  required_providers {
    azurerm = {
      version = "=2.77.0"
    }
  }
}

provider "azurerm" {
  features {}
}
