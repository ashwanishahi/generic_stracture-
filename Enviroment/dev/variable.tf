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
  encryption = optional(map(object({
      enforcement = string
    })), {})  # default empty map

#     ddos_protection_plan = optional(object({            ## id nahi denge , enable = bool kar diya hai
#   enable = bool
# }), null)
    
  subnets = optional(map(object({
  name             = string
  address_prefixes = list(string)
})))

  }))
  
}


variable "pip_details" {
    type = map(object({
        pip_name = string
        rg_name =  string
        location = string
        allocation_method = string
       tags = map(string)
      
    }))
  
}

variable "vms" {
    type = map(object({
      nic_name = string
      subnet_name = string
      vnet_name = string
      pip_name = string
      # ip_configuration = map(string)
      vm_name = string
      rg_name = string
      location =string
      size = string
      admin_username = string
      admin_password = string
      disable_password_authentication = bool
       os_disk = object({
      caching              = string
      storage_account_type = string
    })
      source_image_reference = object({
        publisher = string
        offer = string
        sku = string
        version = string
      })
      
    }))
  
}

variable "key_vaults" {
  type = map(object({
    kv_name = string
    location =string
    rg_name = string
    enabled_for_disk_encryption = bool
    purge_protection_enabled = bool
    soft_delete_retention_days = number

  }))

}