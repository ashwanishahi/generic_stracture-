variable "stg_details" {
  type = map(object({
    stg_name = string
    rg_name = string
    location = string
    account_tier = string
    account_replication_type = string
    tags = optional(object({
      environment = optional(string)
      owner= optional(string)
    }))

    ##### optional #######
 account_kind = optional(string)
access_tier = optional(string)
edge_zone = optional(string)
min_tls_version = optional(string)
network_rules = optional(map(object({
     default_action = optional(string)
 bypass = optional(string)
})))

  }))

  
}