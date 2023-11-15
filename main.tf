resource "azurerm_virtual_network" "vnet" {
  name                = var.name
  resource_group_name = var.resource_group_name
  location            = var.location
  address_space       = var.address_space

  bgp_community           = var.bgp_community
  edge_zone               = var.edge_zone
  flow_timeout_in_minutes = var.flow_timeout_in_minutes

  dynamic "ddos_protection_plan" {
    for_each = var.ddos_protection_plan_id != null ? ["enabled"] : []
    content {
      id     = var.ddos_protection_plan_id
      enable = true
    }
  }

  dynamic "encryption" {
    for_each = var.encryption_enforcement != null ? ["enabled"] : []
    content {
      enforcement = var.encryption_enforcement
    }
  }

  tags = merge(local.module_tags, var.tags)
}

resource "azurerm_virtual_network_dns_servers" "dns" {
  count = var.dns_servers == null ? 0 : 1

  virtual_network_id = azurerm_virtual_network.vnet.id
  dns_servers        = var.dns_servers
}
