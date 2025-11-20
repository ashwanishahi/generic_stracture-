variable "rg_details" {
  type = map(object({
    rg_name    = string
    location   = string
    managed_by = optional(string)
    tags = optional(object({
      environment = optional(string)
      owner       = optional(string)
      
    }))
  }))
}
