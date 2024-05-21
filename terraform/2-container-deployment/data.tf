data "azurerm_resource_group" "resource_group" {
  name = var.resource_group_name
}

data "azurerm_virtual_network" "vnet" {
  resource_group_name = data.azurerm_resource_group.resource_group.name
  name                = var.vnet_name
}

data "azurerm_subnet" "subnet" {
  resource_group_name  = data.azurerm_resource_group.resource_group.name
  virtual_network_name = data.azurerm_virtual_network.vnet.name
  name                 = var.subnet_name
}
