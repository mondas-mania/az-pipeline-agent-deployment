data "azurerm_resource_group" "resource_group" {
  name = var.resource_group_name
}

data "azurerm_virtual_network" "vnet" {
  count               = var.enable_acr && var.enable_acr_endpoint ? 1 : 0
  name                = var.vnet_name
  resource_group_name = data.azurerm_resource_group.resource_group.name
}

data "azurerm_subnet" "endpoint_subnets" {
  for_each             = var.enable_acr && var.enable_acr_endpoint ? var.endpoint_subnet_names : []
  name                 = each.value
  virtual_network_name = data.azurerm_virtual_network.vnet[0].name
  resource_group_name  = data.azurerm_resource_group.resource_group.name
}
