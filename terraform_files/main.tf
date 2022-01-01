## 1. Terraform Settings Block
# A) required version
# B). Required Terraform Providers
# ie - azurerm,azuread,random


## 2. Terraform Remote State Storage with Azure Storage Account (backend) it should be in terraform setting block
# 3. Terraform Provider Block for AzureRM (feature block/ outside setting)
# 4. Terraform Resource Block: Define a Random Pet Resource

#1 Terraform setting block
terraform{
    # A) required version
    required_version = ">=0.13"

# B). Required Terraform Providers
    required_providers {
        azurerm = {
            source = " hashicorp/azurerm"
            version = "2.90.0"
        }

        azuread = {
            source = " hashicorp/azurerm"
            version = "2.13.0"
        }

        random= {
            source  = "hashicorp/random"
            version = "~> 3.0"
        }

    }
    backend "azurerm" {
        resource_group_name = "${var.resource_group_name}"
        storage_account_name = "single-app-storage-accqwe"
        container_name = "single-app-container"
        key = "terraform.tfstate"
      
    }

}

# 3. Terraform "Provider" Block for AzureRM (feature block/ outside setting)
provider "azurerm" {
    features{

    }
}

# 4. Terraform Resource Block: Define a Random Pet Resource
resource "random_pet" "single-app-random_pet" {

  
}