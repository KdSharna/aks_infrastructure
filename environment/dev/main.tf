module "name_rg" {
  source = "../../module/azure_resource_rg"

  rg_name = var.name_rg
}

module "cluster_ks" {
  source     = "../../module/azure_k8s_cluster"
  depends_on = [module.name_rg, module.azure_acr]

  ks_cluster        = var.cluster_ks
  default_node_pool = var.default_node_pool
  acr_id            = module.azure_acr.acr_id["main"]
}

module "azure_acr" {
  source     = "../../module/azure_container_registery"
  depends_on = [module.name_rg]

  acr             = var.azure_acr
  georeplications = var.georeplications
}

module "serversql" {
  source     = "../../module/azure_sql_server"
  depends_on = [module.name_rg]

  sqlserver = var.serversql
}

module "databasesql" {
  source     = "../../module/azure_sql_database"
  depends_on = [module.serversql]

  sqldatabase = var.databasesql
}


# resource "azurerm_role_assignment" "aks_acr" {
#   for_each = module.cluster_ks.kubelet_object_id

#   principal_id                     = each.value
#   role_definition_name             = "AcrPull"
#   scope                            = module.azure_acr.acr_id[each.key]
#   skip_service_principal_aad_check = true

#   depends_on = [
#     module.cluster_ks,
#     module.azure_acr
#   ]
# }