// TODO: delegation

// Private Subnet
//**********************************************************************************************
resource "azurerm_subnet" "private" {
  for_each                                       = var.private_subnets
  name                                           = each.value.name
  resource_group_name                            = each.value.resource_group_name
  virtual_network_name                           = each.value.virtual_network_name
  address_prefixes                               = each.value.address_prefixes
  service_endpoints                              = var.service_endpoints
  enforce_private_link_endpoint_network_policies = var.enforce_private_link_endpoint_network_policies
  depends_on                                     = [var.it_depends_on]
}
//**********************************************************************************************


// Public Subnet
//**********************************************************************************************
resource "azurerm_subnet" "public" {
  for_each             = var.public_subnets
  name                 = each.value.name
  resource_group_name  = each.value.resource_group_name
  virtual_network_name = each.value.virtual_network_name
  address_prefixes     = each.value.address_prefixes
  #  service_endpoints                              = var.service_endpoints
  enforce_private_link_endpoint_network_policies = var.enforce_private_link_endpoint_network_policies
  depends_on                                     = [var.it_depends_on]
}
//**********************************************************************************************



// Network Security Group association
//**********************************************************************************************
resource "azurerm_subnet_network_security_group_association" "nsg_association_private" {
  for_each                  = var.enable_nsg_association_private ? var.private_subnets : {}
  subnet_id                 = azurerm_subnet.private[each.key].id
  network_security_group_id = var.nsg_id_private_subnet

  depends_on = [
    azurerm_subnet.private,
    var.nsg_association_depends_on
  ]
}


resource "azurerm_subnet_network_security_group_association" "nsg_association_public" {
  for_each                  = var.enable_nsg_association_public ? var.public_subnets : {}
  subnet_id                 = azurerm_subnet.public[each.key].id
  network_security_group_id = var.nsg_id_public_subnet

  depends_on = [
    azurerm_subnet.public,
    var.nsg_association_depends_on
  ]
}
//**********************************************************************************************