# Terraform Azure Pipeline Agent Deployment

A simple sandbox test for deploying an Azure Pipelines agent on Container Instances. Uses existing networking.

## Example Variables File

```hcl
resource_group_name = "Sandbox_RG"

enable_acr        = true
acr_registry_name = "SandpitPipelineAgent"
```

<!-- BEGINNING OF PRE-COMMIT-OPENTOFU DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~> 1.0 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | ~> 3.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | ~> 3.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_container_registry.acr](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/container_registry) | resource |
| [azurerm_private_endpoint.acr_private_endpoint](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/private_endpoint) | resource |
| [azurerm_resource_group.resource_group](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/resource_group) | data source |
| [azurerm_subnet.endpoint_subnets](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/subnet) | data source |
| [azurerm_virtual_network.vnet](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/virtual_network) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_acr_registry_name"></a> [acr\_registry\_name](#input\_acr\_registry\_name) | A globally unique name for your Container Registry. | `string` | n/a | yes |
| <a name="input_allow_cidr_ranges"></a> [allow\_cidr\_ranges](#input\_allow\_cidr\_ranges) | A list of CIDR ranges to allow access to ACR for. | `list(string)` | `[]` | no |
| <a name="input_enable_acr"></a> [enable\_acr](#input\_enable\_acr) | Deploys the Azure Container Registry for the ACI to use. | `bool` | `true` | no |
| <a name="input_endpoint_subnet_names"></a> [endpoint\_subnet\_names](#input\_endpoint\_subnet\_names) | The names of the subnet within `vnet_name` that will house ACR private endpoints. | `set(string)` | n/a | yes |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | The name of the resource group to deploy to. | `string` | n/a | yes |
| <a name="input_vnet_name"></a> [vnet\_name](#input\_vnet\_name) | The name of the VNet that will house your agent deployment. | `string` | n/a | yes |

## Outputs

No outputs.
<!-- END OF PRE-COMMIT-OPENTOFU DOCS HOOK -->