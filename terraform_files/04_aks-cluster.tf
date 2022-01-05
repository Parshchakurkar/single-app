resource "azurerm_kubernetes_cluster" "single-app-cluster" {
  resource_group_name = azurerm_resource_group.single-app-resource.name
  location            = azurerm_resource_group.single-app-resource.location
  name                = "${azurerm_resource_group.single-app-resource.name}-cluster"
  dns_prefix          = "${azurerm_resource_group.single-app-resource.name}-cluster"
  node_resource_group = "${azurerm_resource_group.single-app-resource.name}-nrg"
  default_node_pool {
    name       = "systempool"
    vm_size    = "Standard_DS2_v2"
    type       = "VirtualMachineScaleSets"
    node_count = 2

  }

  identity {
    type = "SystemAssigned"
  }

  network_profile {
    network_plugin    = "azure"
    load_balancer_sku = "Standard"
  }

  tags = {
    environemnt = "dev"
  }

}
