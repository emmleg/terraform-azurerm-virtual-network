output "id" {
  value = azurerm_virtual_network.vnet.id
  description = "The ID of the virtual network."
}

output "guid" {
  value = azurerm_virtual_network.vnet.guid
  description = "The GUID of the virtual network."
}

output "name" {
  value = azurerm_virtual_network.vnet.name
  description = "The name of the virtual network."
}