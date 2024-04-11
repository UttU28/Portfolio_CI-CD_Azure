
resource "azurerm_storage_blob" "uploadFilesHTML" {
  for_each = fileset("${github.workspace}/Portfolio", "*.html")

  name                   = "${each.value}"
  storage_account_name   = azurerm_storage_account.storageAccount.name
  storage_container_name = "$web"
  type                   = "Block"
  source                 = "${github.workspace}/Portfolio/${each.value}"
  content_type           = "text/html"
  depends_on = [azurerm_storage_account.storageAccount]
}

resource "azurerm_storage_blob" "uploadFilesCSS" {
  for_each = fileset("${github.workspace}/Portfolio", "*.css")

  name                   = "${each.value}"
  storage_account_name   = azurerm_storage_account.storageAccount.name
  storage_container_name = "$web"
  type                   = "Block"
  source                 = "${github.workspace}/Portfolio/${each.value}"
  content_type           = "text/css"
  depends_on = [azurerm_storage_account.storageAccount]
}

resource "azurerm_storage_blob" "uploadFilesJS" {
  for_each = fileset("${github.workspace}/Portfolio", "*.js")

  name                   = "${each.value}"
  storage_account_name   = azurerm_storage_account.storageAccount.name
  storage_container_name = "$web"
  type                   = "Block"
  source                 = "${github.workspace}/Portfolio/${each.value}"
  content_type           = "text/js"
  depends_on = [azurerm_storage_account.storageAccount]
}

resource "azurerm_storage_blob" "uploadFilesTTF" {
  for_each = fileset("${github.workspace}/Portfolio", "*.ttf")

  name                   = "${each.value}"
  storage_account_name   = azurerm_storage_account.storageAccount.name
  storage_container_name = "$web"
  type                   = "Block"
  source                 = "${github.workspace}/Portfolio/${each.value}"
  content_type           = "application/x-font-truetype"
  depends_on = [azurerm_storage_account.storageAccount]
}

resource "azurerm_storage_blob" "uploadFilesPNG" {
  for_each = fileset("${github.workspace}/Portfolio", "*.png")

  name                   = "${each.value}"
  storage_account_name   = azurerm_storage_account.storageAccount.name
  storage_container_name = "$web"
  type                   = "Block"
  source                 = "${github.workspace}/Portfolio/${each.value}"
  content_type           = "image/png"
  depends_on = [azurerm_storage_account.storageAccount]
}