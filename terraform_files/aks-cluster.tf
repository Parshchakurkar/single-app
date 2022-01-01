resource "azurerm_kubernetes_cluster" "sinfle-app-cluster" {
  resource_group_name = azurerm_resource_group.single-app-resource.name
  location            = azurerm_kubernetes_cluster.sinfle-app-cluster.location
  name                = "${var.resource_group_name}-${var.environemnt}-cluster"
  dns_prefix          = "${var.resource_group_name}-${var.environemnt}-cluster"
  node_resource_group = "${var.resource_group_name}-${var.environemnt}-nrg"

  default_node_pool {
    name       = "systempool"
    vm_size    = "Standard_DS2_v2"
    type       = "VirtualMachineScaleSets"
    node_count = 2

  }

  identity {
    type = "systemAssigned"
  }

  network_profile {
    network_plugin    = "azure"
    load_balancer_sku = "Standard"
  }

  tags = {
    environemnt = "dev"
  }

}