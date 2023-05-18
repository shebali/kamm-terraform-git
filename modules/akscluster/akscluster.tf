resource "azurerm_kubernetes_cluster" "k8s" {
  location = var.project_variables.location
  name                = "${var.project_variables.subscription_name}-aks"
  resource_group_name = "rg-${var.project_variables.project}-${var.project_variables.subscription_name}-terr"
  dns_prefix          = var.project_variables.dns_prefix
  tags     = var.project_variables.tags
  
  default_node_pool {
    name       = "agentpool"
    vm_size    = "Standard_D2_v2"
    node_count = var.project_variables.agent_count
  }
   identity {
    type = "SystemAssigned"
  }
}

 