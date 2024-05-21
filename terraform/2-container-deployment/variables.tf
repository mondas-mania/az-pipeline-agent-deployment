variable "resource_group_name" {
  description = "The name of the resource group to deploy to."
  type        = string
}

variable "vnet_name" {
  description = "The name of the VNet to deploy the Container Apps solution into."
  type        = string
}

variable "subnet_name" {
  description = "The name of the Subnet in `vnet_name` to deploy the Container Apps solution into."
  type        = string
}
