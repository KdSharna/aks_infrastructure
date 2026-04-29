output "kubelet_object_id" {
  value = {
    for k, v in azurerm_kubernetes_cluster.ks_cluster :
    k => v.kubelet_identity[0].object_id
  }
}