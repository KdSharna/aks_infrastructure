variable "acr" {
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