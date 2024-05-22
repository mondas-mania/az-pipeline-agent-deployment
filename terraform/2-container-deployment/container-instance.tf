resource "azurerm_container_group" "pipeline_agent" {
  for_each            = var.enable_container_instance ? toset(["1"]) : []
  name                = "pipelineagentcontainer"
  location            = data.azurerm_resource_group.resource_group.location
  resource_group_name = data.azurerm_resource_group.resource_group.name
  ip_address_type     = "Private"
  os_type             = "Windows"
  subnet_ids          = [data.azurerm_subnet.subnet.id]

  container {
    name   = "pipelineagent"
    image  = "${data.azurerm_container_registry.acr_registry.login_server}/${var.acr_image_name}:${var.acr_image_tag}"
    cpu    = "0.5"
    memory = "1.5"

    environment_variables = {
      "AZP_POOL" = var.azure_devops_agent_pool
      "AZP_URL"  = var.azure_devops_url
    }

    secure_environment_variables = {
      "AZP_TOKEN" = azurerm_key_vault_secret.pat_token.value
    }

    ports {
      port     = 443
      protocol = "TCP"
    }

    ports {
      port     = 80
      protocol = "TCP"
    }
  }

  image_registry_credential {
    username = data.azurerm_container_registry.acr_registry.admin_username
    password = data.azurerm_container_registry.acr_registry.admin_password
    server   = data.azurerm_container_registry.acr_registry.login_server
  }
}