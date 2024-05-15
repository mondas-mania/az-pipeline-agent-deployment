resource "azapi_resource" "pull_through_cache_rule" {
  type      = "Microsoft.ContainerRegistry/registries/cacheRules@2023-01-01-preview"
  name      = var.acr_registry_name
  parent_id = data.azurerm_resource_group.resource_group.id
  body = jsonencode({
    properties = {
      credentialSetResourceId = "string"
      sourceRepository        = "string"
      targetRepository        = "string"
    }
  })
}
