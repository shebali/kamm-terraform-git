/*resource "azurerm_resource_group" "rg" {
  name     = "rg-maas-test2"
  location = var.project_variables.location
  tags     = var.project_variables.tags
} */

 module "resourcegroup" {
  source            = "./modules/resourcegroup"
  project_variables = var.project_variables
} 

/*module "akscluster" {
  source            = "./modules/akscluster"
  project_variables = var.project_variables
} 
*/

/*module "mssqldatabase" {
  source            = "./modules/mssqldatabase"
  project_variables = var.project_variables
  az_sqlserver = var.az_sqlserver
  az_sqldatabase = var.az_sqldatabase
} 
*/

/*
module "virtual_network" {
  source            = "../../maasinfra-caf-tf-modules/virtual_network"
  project_variables = var.project_variables
  vnet_variables    = var.vnet_variables
  subnet_variables  = var.subnet_variables
}

module "virtual_machine" {
  source                  = "../../maasinfra-caf-tf-modules/virtual_machine"
  project_variables       = var.project_variables
  public_ips              = var.public_ips
  network_interfaces      = var.network_interfaces
  network_security_groups = var.network_security_groups
  windows_vm              = var.windows_vm
  subnet_variables        =  module.virtual_network.subnet_ids
}

module "azure_postgresql" {
  source            = "../../maasinfra-caf-tf-modules/azure-postgresql"
  project_variables = var.project_variables
  az_postgresql     = var.az_postgresql
} */

/*module "azure_ag" {

  source                    = "../../maasinfra-caf-tf-modules/app-gateway"
  project_variables         = var.project_variables
  subnet_variables          = module.virtual_network.subnet_ids
  public_ip                 =  var.public_ip
  app_gateways              = var.app_gateways
  keyvault_variables        = var.keyvault_variables

}*/
