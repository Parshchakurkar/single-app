resource "azurerm_resource_group" "single-app-resource" {
  location = var.location
  name     = "${var.resource_group_name}-${var.environment}"
  provider = azurerm.singleappprovider


}