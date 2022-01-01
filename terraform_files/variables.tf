variable "location" {
    default = "Central US"
    description = "It will the location of cluster"
}

#resource group name
variable "resource_group_name" {
  default = "single-app-resource-group"
}

#env of cluster
variable "environment" {
    default = "dev"
}