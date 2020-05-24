// Private Subnets
output "private_subnets" {
  description = "All Private Subnet's attributes"
  value       = azurerm_subnet.private
}

// Public Subnets
output "public_subnets" {
  description = "All Public Subnet's attributes"
  value       = azurerm_subnet.public
}