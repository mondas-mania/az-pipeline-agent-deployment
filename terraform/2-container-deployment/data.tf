data "azurerm_resource_group" "resource_group" {
  name = var.resource_group_name
}

output "placeholder" {
  description = "A placeholder to prevent TFLint issues"
  value       = data.azurerm_resource_group.resource_group.id
}
