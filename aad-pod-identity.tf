resource "local_file" "kubeconfig" {
  sensitive_content = azurerm_kubernetes_cluster.cloudcommons.kube_admin_config_raw
  filename = "aad-pod-identity/.kube/config"
  yml = ""
}

resource "null_resource" "cert_manager" {
  provisioner "local-exec" {
    working_dir = "aad-pod-identity/v0.10.1"	
    command     = "kubectl apply -f crds.yml --kubeconfig ./.kube/config && kubectl apply -f cluster-issuer.yml --kubeconfig ./.kube/config"
    environment = {
      name           = local.name
      resource_group = local.resource_group
    }
  }
  depends_on = [module.<%= name %>-kubernetes, local_file.kubeconfig]
}