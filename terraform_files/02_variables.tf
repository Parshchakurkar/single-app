variable "location" {
  default     = "Central US"
  description = "It will the location of cluster"
}

#resource group name
variable "resource_group_name" {
  default = "single-app-resource-group"
}


variable "environment" {
  default = "dev"
}

variable "client_id" {}

variable "client_secret" {}

variable "ssh_key" {
}