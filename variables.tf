
// Required Variables
//**********************************************************************************************
variable "public_subnets" {
  type = map(object({
    name                 = string
    resource_group_name  = string
    virtual_network_name = string
    address_prefixes     = list(string)
  }))
  description = "(Required) Default arguments for public subnet"
  default     = {}
}

variable "private_subnets" {
  type = map(object({
    name                 = string
    resource_group_name  = string
    virtual_network_name = string
    address_prefixes     = list(string)
  }))
  description = "(Required) Default arguments for private subnet"
  default     = {}
}
//**********************************************************************************************


// Optional Variables
//**********************************************************************************************
variable "private_subnet_prefix" {
  type        = string
  description = "(Optional) Default prefix for private subnet"
  default     = "private-subnet"
}
variable "public_subnet_prefix" {
  type        = string
  description = "(Optional) Default prefix for public subnet"
  default     = "public-subnet"
}
variable "nsg_id_private_subnet" {
  type        = string
  description = "(Required) The list of the Network Security Group id which should be associated with the Private Subnet"
  default     = null
}
variable "nsg_id_public_subnet" {
  type        = string
  description = "(Required) The list of the Network Security Group id which should be associated with the Public Subnet"
  default     = null
}
variable "service_endpoints" {
  type        = list(string)
  description = "(Optional) The list of Service endpoints to associate with the subnet"
  default     = []
}
variable "enforce_private_link_endpoint_network_policies" {
  type        = bool
  description = "(Optional) Enable or Disable network policies for the private link endpoint on the subnet"
  default     = true
}
variable "resource_tags" {
  type        = map(string)
  description = "(Optional) Tags for resources"
  default     = {}
}
variable "deployment_tags" {
  type        = map(string)
  description = "(Optional) Tags for deployment"
  default     = {}
}
variable "it_depends_on" {
  type        = any
  description = "(Optional) To define explicit dependencies if required"
  default     = null
}
variable "nsg_association_depends_on" {
  type        = any
  description = "(Required) To define explicit dependencies on NSG id for azurerm_subnet_network_security_group_association"
  default     = null
}
variable "enable_nsg_association_private" {
  type        = bool
  description = "(Optional) Create on not NSG association for Private Subnet"
  default     = false
}
variable "enable_nsg_association_public" {
  type        = bool
  description = "(Optional) Create on not NSG association for Public Subnet"
  default     = false
}
//**********************************************************************************************