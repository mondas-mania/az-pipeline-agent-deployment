variable "resource_group_name" {
  description = "The name of the resource group to deploy to."
  type        = string
}

variable "vnet_name" {
  description = "The name of the VNet to deploy the Container Apps solution into."
  type        = string
}

variable "subnet_name" {
  description = <<EOT
  The name of the Subnet in `vnet_name` to deploy the Container Apps solution into.
  This subnet must be delegated to `Microsoft.ContainerInstance/containerGroups`.
  EOT
  type        = string
}

variable "pat_token" {
  description = <<EOT
  The PAT Token for the Pipeline Agent to run with. This needs Agent Pool (Read, Manage) permissions.
  This will be stored in plaintext in the state.
  EOT
  type        = string
  sensitive   = true
}

# variable "enable_container_apps" {
#   description = "Boolean to determine whether to deploy the Container Apps setup. Defaults to false."
#   type        = bool
#   default     = false
# }


variable "number_of_agents" {
  description = <<EOT
  The number of agents to deploy. Each agent will constitute its own Container Instance deployment.
  Set to 0 to disable Container Instance deployments.
  EOT
  type        = number
  default     = 1
}

variable "acr_registry_name" {
  description = "The name of the ACR Registry to pull from."
  type        = string
}

variable "acr_image_name" {
  description = "The name of the image to pull from `acr_registry_name`."
  type        = string
  default     = "azp-agent"
}

variable "acr_image_tag" {
  description = "The name of the tag for the image `acr_image_name` in `acr_registry_name`."
  type        = string
  default     = "windows"
}

variable "azure_devops_url" {
  description = "The URL of your Azure DevOps instance. This will typically be https://dev.azure.com/{instance}"
  type        = string
}

variable "azure_devops_agent_pool" {
  description = "The name of an existing Pipeline Agent Pool in your DevOps organisation."
  type        = string
  default     = "Default"
}
