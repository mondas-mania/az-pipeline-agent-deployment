# Terraform ACR Deployment

A simple sandbox test for deploying an Azure Container Registry with private network connectivity. Uses existing networking.

## Caveats

- The sandpit account I have access to in development does not allow me the roleAssignments/write permissions so I cannot use a managed user identity for ACR encryption.

## Example Variables File

```hcl
resource_group_name   = "Sandbox_RG"
vnet_name             = "internal-vnet-1"
endpoint_subnet_names = ["private-subnet-0"]

enable_acr = true

acr_registry_name = "SandpitPipelineAgent"
allow_cidr_ranges = [
  "1.2.3.4/32",
  "10.0.0.0/8"
]
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
| [azurerm_private_dns_zone.azurecr_io](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/private_dns_zone) | resource |
| [azurerm_private_dns_zone_virtual_network_link.azurecr_io_vnet_link](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/private_dns_zone_virtual_network_link) | resource |
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
