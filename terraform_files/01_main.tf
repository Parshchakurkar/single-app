## 1. Terraform Settings Block
# A) required version
# B). Required Terraform Providers
# ie - azurerm,azuread,random


## 2. Terraform Remote State Storage with Azure Storage Account (backend) it should be in terraform setting block
# 3. Terraform Provider Block for AzureRM (feature block/ outside setting)
# 4. Terraform Resource Block: Define a Random Pet Resource

#1 Terraform setting block
terraform {
  # A) required version
  required_version = ">=0.13"

  # B). Required Terraform Providers
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      #version = "=2.46.0"
    }

    azuread = {
      source = "hashicorp/azurerm"
      #version = "~> 2.0.0"
    }

    random = {
      source  = "hashicorp/random"
      version = "~> 3.0"
    }

  }
  backend "azurerm" {
    resource_group_name  = "single-app-resource-grp"
    storage_account_name = "singleappstogae"
    container_name       = "singleappcontainer"
    key                  = "terraform.tfstate"

  }

}


# 3. Terraform "Provider" Block for AzureRM (feature block/ outside setting)
provider "azurerm" {
  features {}
}


resource "azurerm_resource_group" "single-app-resource" {
  location = var.location
  name     = "${var.resource_group_name}-${var.environment}"
  #provider = azurerm.singleappprovider


}

# 4. Terraform Resource Block: Define a Random Pet Resource
resource "random_pet" "single-app-random_pet" {


}



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
