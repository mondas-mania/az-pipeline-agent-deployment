# https://learn.microsoft.com/en-gb/azure/private-link/private-endpoint-dns#containers

resource "azurerm_private_dns_zone" "azurecr_io" {
  name                = "privatelink.azurecr.io"
  resource_group_name = data.azurerm_resource_group.resource_group.name
}

resource "azurerm_private_dns_zone" "data_azurecr_io" {
  name                = "${data.azurerm_resource_group.resource_group.location}.data.privatelink.azurecr.io"
  resource_group_name = data.azurerm_resource_group.resource_group.name
}