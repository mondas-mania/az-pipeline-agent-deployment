variable "resource_group_name" {
  description = "The name of the resource group to deploy to."
  type        = string
}

variable "vnet_name" {
  description = "The name of the VNet that will house your agent deployment."
  type        = string
}

variable "endpoint_subnet_names" {
  description = "The names of the subnet within `vnet_name` that will house ACR private endpoints."
  type        = set(string)
}

variable "enable_acr" {
  description = "Deploys the Azure Container Registry for the ACI to use."
  type        = bool
  default     = true
}

variable "acr_registry_name" {
  description = "A globally unique name for your Container Registry."
  type        = string
}

variable "allow_cidr_ranges" {
  description = "A list of CIDR ranges to allow access to ACR for."
  type        = list(string)
  default     = []
}
