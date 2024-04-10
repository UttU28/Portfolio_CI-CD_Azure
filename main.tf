terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.98.0"
    }
  }
}

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "resourceGroup" {
  name     = "rg-portfolio"
  location = "westus"
}

resource "azurerm_storage_account" "storageAccount" {
  name                = "storageportfolio2"
  resource_group_name = azurerm_resource_group.resourceGroup.name
  location            = azurerm_resource_group.resourceGroup.location

  account_tier             = "Standard"
  account_replication_type = "LRS"
  account_kind             = "StorageV2"

  enable_https_traffic_only = true

  static_website {
    index_document = "index.html"
  }
}

data "azurerm_storage_account" "example" {
  name                     = azurerm_storage_account.storageAccount.name
  resource_group_name      = azurerm_resource_group.resourceGroup.name
}

output "static_website_url" {
  value = data.azurerm_storage_account.example.primary_web_endpoint
}