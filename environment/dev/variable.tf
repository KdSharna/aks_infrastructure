variable "name_rg" {
  type = map(object({
    name       = string
    location   = string
    managed_by = string
    tags       = optional(map(string))
    # cost_center = string
  }))
}


variable "cluster_ks" {
  type = map(object({
    name                = string
    location            = string
    resource_group_name = string
    dns_prefix          = string
  }))
}
variable "default_node_pool" {
  type = map(object({
    name       = string
    node_count = number
    vm_size    = string

  }))
}
variable "environment" {
  type    = string
  default = "Project"
}

variable "project_name" {
  type    = string
  default = "akd_project"
}


variable "azure_acr" {
  type = map(object({
    name                = string
    resource_group_name = string
    location            = string
    sku                 = string
    admin_enabled       = bool

  }))
}

variable "georeplications" {
  type = map(object({
    location                = string
    zone_redundancy_enabled = bool
  }))

}

variable "serversql" {
  type = map(object({
    name                         = string
    resource_group_name          = string
    location                     = string
    version                      = string
    administrator_login          = string
    administrator_login_password = string
    minimum_tls_version          = string
  }))
}

variable "databasesql" {
  type = map(object({
    name = string
    # server_id    = string
    collation    = string
    license_type = string
    max_size_gb  = number
    sku_name     = string
    enclave_type = string
    sql_name     = string
    rg_name      = string
  }))
}