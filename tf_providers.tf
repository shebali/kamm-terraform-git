terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.1.0"
    }
    azuread = {
      source  = "hashicorp/azuread"
      version = "2.20.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "3.1.2"
    }
  }
  backend "azurerm" {
    # tenant id - app registration terraformPOC 
    /*storage_account_name = "maasstaccountnew"
    container_name       = "maasterraform"
    key                  = "maas.tfstate"
    use_azuread_auth     = true
    subscription_id      = "8202efd8-1b9f-4133-ba1f-c1f643bb367f"
    tenant_id            = "9f58333b-9cca-4bd9-a7d8-151e43b79f3"  */
  } 
}

provider "azurerm" {
  # Configuration options
 # subscription_id = var.project_variables.subscription_ids.maas
 # tenant_id       = var.project_variables.tenant_id
  features {}
}

provider "azuread" {
  # Configuration options
 # tenant_id = var.project_variables.tenant_id
}

provider "random" {
  # Configuration options
}
