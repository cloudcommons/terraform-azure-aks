variable name {
  type        = string
  description = "(Required) The name of the Azure Kubernetes Service. Changing this forces a new resource to be created."
}
variable location {
  type        = string
  description = "(Required) The location where the resource group should be created. For a list of all Azure locations, please consult this link or run az account list-locations --output table."
}

variable resource_group {
  type        = string
  description = "(Required) The name of the resource group in which to create the virtual network."
}

variable kubernetes_version {
  type        = string
  description = "(Required) Version of Kubernetes specified when creating the AKS managed cluster. If not specified, the latest recommended version will be used at provisioning time (but won't auto-upgrade). NOTE: Upgrading your cluster may take up to 10 minutes per node."
}

variable app {
  type        = string
  description = "(Optional) Adds a tag with the application name this resource group belogs to."
  default     = ""
}

variable environment {
  type        = string
  description = "(Optional) Environment name. If not specified, this module will use workspace as default value"
  default     = "default"
}

variable creator {
  type        = string
  description = "(Optional) Adds a tag indicating the creator of this resource"
  default     = "cloudcommons"
}

variable client_id {
  type        = string
  description = "client_id - (Required) The Client ID for the Service Principal."
}

variable client_secret {
  type        = string
  description = "(Required) The Client Secret for the Service Principal."
}

variable node_resource_group {
  type        = string
  description = "(Optional) The name of the Resource Group where the Kubernetes Nodes should exist. Changing this forces a new resource to be created. If empty, this module will generate a friendly name"
  default     = ""
}

variable node_public_ip_enable {
  type        = bool
  description = "(Optional) Should nodes in this Node Pool have a Public IP Address? Defaults to false."
  default     = false
}

variable dns_prefix {
  type        = string
  description = "(Optional) DNS prefix to append to the cluster. Default: cloudcommons"
  default     = "cloudcommons"
}

variable node_pool_name {
  type        = string
  description = "(Optional) Node Pool name. Default: default"
  default     = "default"
}

variable node_pool_count {
  type        = number
  description = "(Optional) Number of pool virtual machines to create. Default: 3"
  default     = 2
}

variable node_pool_os_disk_size_gb {
  type        = number
  description = "(Optional) The size of the OS Disk which should be used for each agent in the Node Pool. Changing this forces a new resource to be created. Default: 60"
  default     = 60
}

variable "node_pool_max_pods" {
  type        = number
  description = "(Optional) The maximum number of pods that can run on each agent. Changing this forces a new resource to be created."
  default     = 60
}

variable "node_pool_type" {
  type        = string
  description = "(Optional) The type of Node Pool which should be created. Possible values are AvailabilitySet and VirtualMachineScaleSets. Defaults to VirtualMachineScaleSets."
  default     = "VirtualMachineScaleSets"
}

variable "auto_scaling_enable" {
  type        = bool
  description = "(Optional) Should the Kubernetes Auto Scaler be enabled for this Node Pool? Defaults to false."
  default     = false
}

variable "auto_scaling_min_count" {
  type        = number
  description = "(Optional) The minimum number of nodes which should exist in this Node Pool. If specified this must be between 1 and 100"
  default     = 0
}

variable "auto_scaling_max_count" {
  type        = number
  description = "(Optional) The maximum number of nodes which should exist in this Node Pool. If specified this must be between 1 and 100."
  default     = 0
}

variable "kube_dashboard_enabled" {
  type        = bool
  description = "(Optional) Is the Kubernetes Dashboard enabled?"
  default     = false
}

variable node_pool_vm_size {
  type        = string
  description = "(Optional) VM Size to create in the default node pool. Default: Standard_DS3_v2"
  default     = "Standard_DS3_v2"
}

variable network_plugin {
  type        = string
  description = "(Optional) Network plugin to use for networking. Currently supported values are azure and kubenet. Changing this forces a new resource to be created. Defaults to azure"
  default     = "azure"
}

variable network_docker_bridge_cidr {
  type        = string
  description = "(Optional) IP address (in CIDR notation) used as the Docker bridge IP address on nodes. This is required when network_plugin is set to azure. Changing this forces a new resource to be created. Defaults to 172.17.0.1/16"
  default     = "172.17.0.1/16"
}

variable network_policy {
  type        = string
  description = "(Optional) Sets up network policy to be used with Azure CNI. Network policy allows us to control the traffic flow between pods. This field can only be set when network_plugin is set to azure. Currently supported values are calico and azure. Changing this forces a new resource to be created. Defaults to calico"
  default     = "calico"
}

variable network_load_balancer_sku {
  type        = string
  description = "(Optional) Specifies the SKU of the Load Balancer used for this Kubernetes Cluster. Possible values are basic and standard. Defaults to basic."
  default     = "basic"
}

variable rbac_enabled {
  type        = bool
  description = "(Required) Is Role Based Access Control Enabled? Changing this forces a new resource to be created. Defaults to true"
  default     = true
}

variable rbac_aad {
  type        = bool
  description = "(Optional) Use Azure Active Directory as RBAC system. If not client_app_id is provided, this module will try creating an Azure Application for you"
  default     = false
}

variable rbac_aad_admin {
  type        = string
  description = "(Optional) Default Azure Active Directory user assigned as cluster administrator"
  default     = null
}

variable rbac_aad_client_app_id {
  type        = string
  description = "(Optional) The Client ID of an Azure Active Directory Application. Changing this forces a new resource to be created."
  default     = null
}

variable rbac_aad_server_app_id {
  type        = string
  description = "(Optional) The Server ID of an Azure Active Directory Application. Changing this forces a new resource to be created."
  default     = null
}

variable rbac_aad_server_app_secret {
  type        = string
  description = "(Optional) The Server Secret of an Azure Active Directory Application. Changing this forces a new resource to be created."
  default     = null
}

variable rbac_aad_tenant_id {
  type        = string
  description = "(Optional) The Tenant ID used for Azure Active Directory Application. If this isn't specified the Tenant ID of the current Subscription is used. Changing this forces a new resource to be created."
  default     = null
}

variable linux_admin_username {
  type        = string
  description = "(Optional) The Admin Username for the Cluster. Changing this forces a new resource to be created. Defaults to cloudcommons"
  default     = "cloudcommons"
}

variable linux_ssh_key {
  type        = string
  description = "(Required) The Public SSH Key used to access the cluster. Changing this forces a new resource to be created."
}

variable vnet_create {
  type        = bool
  description = "(Optional) Indicates if the module should create a VNET or use an existing one. Defaults to true"
  default     = true
}

variable vnet_service_id {
  type        = string
  description = "(Optional) If specified, uses an existing VNET instead of creating a new one"
  default     = null
}

variable vnet_address_space {
  type        = list(string)
  description = "(Optional) The address space that is used the virtual network. You can supply more than one address space. Changing this forces a new resource to be created."
  default     = ["10.0.0.0/21"]
}

variable vnet_service_cidr {
  type        = string
  description = "(Optional) The service cidr"
  default     = "10.0.2.0/23"
}

variable vnet_dns_servers {
  type        = list(string)
  description = "(Optional) List of DNS Servers configured in the VNET"
  default     = null
}

variable vnet_ddos_enabled {
  type        = bool
  description = "(Optional) Adds a DDOS protection to the VNET. Defaults to false"
  default     = false
}

variable vnet_nsg_enabled {
  type        = bool
  description = "(Optional) Adds NSG to the VNET."
  default     = true
}

variable vnet_subnets {
  type = list(object({
    name           = string,
    address_prefix = string,
    security_group = bool
  }))
  description = "(Optional) Creates the given subnets in the VNET. IMPORTANT: Services subnet should be the second Subnet in this list, as the network_profile is assuming this."
  default = [
    {
      name           = "Ingresses"
      address_prefix = "10.0.0.0/23"
      security_group = true
    },
    # Azure don't like Terraform to create the service subnet... so we should skip it
    # {
    #   name           = "Services"
    #   address_prefix = "10.0.2.0/23"
    #   security_group = false
    # },
    {
      name           = "Cluster"
      address_prefix = "10.0.4.0/22"
      security_group = false
    }
  ]
}

variable aad_pod_identity_enabled {
  type        = bool
  description = "(Optional) Enables Azure Active Directory Pod Identity provides token-based access to Azure Resource Manager. Defaults to false"
  default     = false
}
