resource "azurerm_log_analytics_workspace" "log_workspace" {
  name                = "pipeline-agent-workspace"
  location            = data.azurerm_resource_group.resource_group.location
  resource_group_name = data.azurerm_resource_group.resource_group.name
  sku                 = "PerGB2018"
  retention_in_days   = 30
}
