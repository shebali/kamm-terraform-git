resource "azurerm_mssql_server" "sqlserv" {
  
  name     = var.az_sqlserver.name
  location = var.project_variables.location
  tags     = var.project_variables.tags
  resource_group_name          = "rg-${var.project_variables.project}-${var.project_variables.environment}-test"
  version                      = var.az_sqlserver.version
  administrator_login          = var.az_sqlserver.administrator_login
  administrator_login_password = var.az_sqlserver.administrator_login_password
}

resource "azurerm_mssql_database" "sqldb" {
  name           = var.az_sqldatabase.name
  server_id      = azurerm_mssql_server.sqlserv.id
  collation      = var.az_sqldatabase.collation
  license_type   = var.az_sqldatabase.license_type
  max_size_gb    = var.az_sqldatabase.max_size_gb
  read_scale     = var.az_sqldatabase.read_scale
  sku_name       = var.az_sqldatabase.sku_name
  zone_redundant = var.az_sqldatabase.zone_redundant
  
   tags     = var.project_variables.tags
 }

