terraform {
    required_providers {
        azurerm = {
            version = "=2.77.0" 
        }
    }
}

provider "azurerm" {
    #version                    = "=2.77.0"
    skip_provider_registration = true
    subscription_id            = var.SUBSCRIPTION_ID
    tenant_id                  = var.TENANT_ID
    features {}
}