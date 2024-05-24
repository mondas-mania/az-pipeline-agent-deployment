resource "azurerm_private_endpoint" "acr_private_endpoint" {
  for_each            = var.enable_acr && var.enable_acr_endpoint ? data.azurerm_subnet.endpoint_subnets : {}
  name                = "acr-pipeline-agent-endpoint"
  location            = data.azurerm_resource_group.resource_group.location
  resource_group_name = data.azurerm_resource_group.resource_group.name
  subnet_id           = each.value.id

  private_service_connection {
    name                           = "acr-privateserviceconnection"
    private_connection_resource_id = azurerm_container_registry.acr[0].id
    subresource_names              = ["registry"]
    is_manual_connection           = false
  }

  private_dns_zone_group {
    name                 = "acr-pipeline-group"
    private_dns_zone_ids = [azurerm_private_dns_zone.azurecr_io[0].id]
  }
}
