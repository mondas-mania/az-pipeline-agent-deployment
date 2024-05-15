# Terraform Container Instance Deployment

A simple sandbox test for deploying the previously-built Azure Pipeline Agent container image into Azure Container Instances. Uses existing networking.

## Caveats

- This has to be run as the final stage of deployment as this relies on stage 0 (deploying the ACR registry) and stage 1 (building and pushing the container image to the ACR registry).

## Example Variables File

```hcl
resource_group_name = "Sandbox_RG"
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
| [azurerm_resource_group.resource_group](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/resource_group) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | The name of the resource group to deploy to. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_placeholder"></a> [placeholder](#output\_placeholder) | A placeholder to prevent TFLint issues |
<!-- END OF PRE-COMMIT-OPENTOFU DOCS HOOK -->
