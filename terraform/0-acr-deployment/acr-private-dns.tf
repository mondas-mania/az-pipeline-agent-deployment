# https://learn.microsoft.com/en-gb/azure/private-link/private-endpoint-dns#containers

resource "azurerm_private_dns_zone" "azurecr_io" {
  count               = var.enable_acr && var.enable_acr_endpoint ? 1 : 0
  name                = "privatelink.azurecr.io"
  resource_group_name = data.azurerm_resource_group.resource_group.name
}

resource "azurerm_private_dns_zone_virtual_network_link" "azurecr_io_vnet_link" {
  count                 = var.enable_acr && var.enable_acr_endpoint ? 1 : 0
  name                  = "azurecr_io_vnet_link"
  resource_group_name   = data.azurerm_resource_group.resource_group.name
  private_dns_zone_name = azurerm_private_dns_zone.azurecr_io[0].name
  virtual_network_id    = data.azurerm_virtual_network.vnet.id
}
