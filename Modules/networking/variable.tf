
variable "vnet_details" {
  type = map(object({
    vnet_name = string
    location = string
    rg_name = string
    address_space = list(string)
    dns_servers = optional(list(string), [])
    tags = optional(map(string), {})
   ip_address_pool = optional(list(object({
      id = string
      number_of_ip_addresses = string
    })))
    bgp_community = optional(string , null)           
#     ddos_protection_plan = optional(object({            ## id nahi denge , enable = bool kar diya hai
#   enable = bool
# }), null)

encryption = optional(map(object({
      enforcement = string
    })), {})  # default empty map
    subnets = optional(map(object({
  name             = string
  address_prefixes = list(string)
})))

  }))
  
}
