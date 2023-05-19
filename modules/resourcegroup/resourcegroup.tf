# Azure Resource Group
# name     = "rg-${var.project_variables.project}-${var.project_variables.subscription_name}"
resource "azurerm_resource_group" "rg" {
  name     = "rg-${var.project_variables.project}-${var.project_variables.environment}-test"
  location = var.project_variables.location
  tags     = var.project_variables.tags
}

resource "azurerm_resource_group" "rg2" {
  name     = "rg-${var.project_variables.project}-${var.project_variables.environment}-test5"
  location = var.project_variables.location
  tags     = var.project_variables.tags
}
