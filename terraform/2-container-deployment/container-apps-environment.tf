resource "azurerm_container_app_environment" "pipeline_agent_environment" {
  name                       = "pipeline-agent-environment"
  location                   = data.azurerm_resource_group.resource_group.location
  resource_group_name        = data.azurerm_resource_group.resource_group.name
  log_analytics_workspace_id = azurerm_log_analytics_workspace.log_workspace.id

  infrastructure_resource_group_name = "PipelineAgentContainerAppsRG"
  infrastructure_subnet_id           = data.azurerm_subnet.subnet.id
  internal_load_balancer_enabled     = false

  workload_profile {
    name                  = "Consumption"
    workload_profile_type = "Consumption"
  }
}
