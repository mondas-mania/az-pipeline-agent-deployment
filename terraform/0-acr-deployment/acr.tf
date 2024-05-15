resource "azurerm_container_registry" "acr" {
  count               = var.enable_acr ? 1 : 0
  name                = var.acr_registry_name
  resource_group_name = data.azurerm_resource_group.resource_group.name
  location            = data.azurerm_resource_group.resource_group.location
  sku                 = "Premium" # Required for private access
  admin_enabled       = false

  public_network_access_enabled = true
  data_endpoint_enabled         = false

  network_rule_set = [
    {
      default_action  = "Allow"
      virtual_network = []
      ip_rule = [for ip in var.allow_cidr_ranges :
        {
          action   = "Allow"
          ip_range = ip
        }
      ]
    }
  ]
}
