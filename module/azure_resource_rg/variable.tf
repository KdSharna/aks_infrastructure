variable "rg_name" {
  type = map(object({
    name     = string
    location = string
managed_by= string
tags =optional(map(string))
  # cost_center =string
  }))
}
