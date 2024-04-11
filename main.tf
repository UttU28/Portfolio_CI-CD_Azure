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

output "pathModule" {
  value = path.module
}



resource "azurerm_storage_blob" "uploadFilesHTML" {
  for_each = fileset("${path.module}/Portfolio", "*.html")

  name                   = "${each.value}"
  storage_account_name   = azurerm_storage_account.storageAccount.name
  storage_container_name = "$web"
  type                   = "Block"
  source                 = "${path.module}/Portfolio/${each.value}"
  content_type           = "text/html"
  depends_on = [azurerm_storage_account.storageAccount]
}

resource "azurerm_storage_blob" "uploadFilesCSS" {
  for_each = fileset("${path.module}/Portfolio", "*.css")

  name                   = "${each.value}"
  storage_account_name   = azurerm_storage_account.storageAccount.name
  storage_container_name = "$web"
  type                   = "Block"
  source                 = "${path.module}/Portfolio/${each.value}"
  content_type           = "text/css"
  depends_on = [azurerm_storage_account.storageAccount]
}

resource "azurerm_storage_blob" "uploadFilesJS" {
  for_each = fileset("${path.module}/Portfolio", "*.js")

  name                   = "${each.value}"
  storage_account_name   = azurerm_storage_account.storageAccount.name
  storage_container_name = "$web"
  type                   = "Block"
  source                 = "${path.module}/Portfolio/${each.value}"
  content_type           = "text/js"
  depends_on = [azurerm_storage_account.storageAccount]
}

resource "azurerm_storage_blob" "uploadFilesTTF" {
  for_each = fileset("${path.module}/Portfolio", "*.ttf")

  name                   = "${each.value}"
  storage_account_name   = azurerm_storage_account.storageAccount.name
  storage_container_name = "$web"
  type                   = "Block"
  source                 = "${path.module}/Portfolio/${each.value}"
  content_type           = "application/x-font-truetype"
  depends_on = [azurerm_storage_account.storageAccount]
}

resource "azurerm_storage_blob" "uploadFilesPNG" {
  for_each = fileset("${path.module}/Portfolio", "*.png")

  name                   = "${each.value}"
  storage_account_name   = azurerm_storage_account.storageAccount.name
  storage_container_name = "$web"
  type                   = "Block"
  source                 = "${path.module}/Portfolio/${each.value}"
  content_type           = "image/png"
  depends_on = [azurerm_storage_account.storageAccount]
}