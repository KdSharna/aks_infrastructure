resource "azurerm_kubernetes_cluster" "ks_cluster" {
  for_each            = var.ks_cluster
  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name
  dns_prefix          = each.value.dns_prefix

  dynamic "default_node_pool" {
    for_each = var.default_node_pool
    # iterator = default_node_pool
    content {
      name       = default_node_pool.value.name
      node_count = default_node_pool.value.node_count
      vm_size    = default_node_pool.value.vm_size
    }

  }
  identity {
    type = "SystemAssigned"
  }
  tags = local.common_tags
}
