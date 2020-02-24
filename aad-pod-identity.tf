locals {
  yml = var.rbac_enabled ? "aad-pod-identity-rbac.yml" : "aad-pod-identity.yml"
}

resource "local_file" "kubeconfig" {
  content = azurerm_kubernetes_cluster.cloudcommons.kube_admin_config_raw
  filename = "aad-pod-identity/.kube/config"
}

resource "null_resource" "aad-pod-identity" {
  count = var.aad_pod_identity_enabled ? 1 : 0
  provisioner "local-exec" {   
    working_dir = "."
    command     = "kubectl apply -f ${local.yml} --kubeconfig ${local_file.kubeconfig.filename}"
    environment = {
      name           = var.name
      resource_group = var.resource_group
    }
  }
  depends_on = [azurerm_kubernetes_cluster.cloudcommons, local_file.kubeconfig]
}