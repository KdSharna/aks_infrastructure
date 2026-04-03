variable "ks_cluster" {
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
locals {
  common_tags = {
    environment = var.environment
    project     = var.project_name
  }
}
