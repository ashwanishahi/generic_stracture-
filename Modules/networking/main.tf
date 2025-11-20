resource "azurerm_virtual_network" "vnet" {
  for_each = var.vnet_details
  name                = each.value.vnet_name
  location            = each.value.location
  resource_group_name = each.value.rg_name
  address_space       =   each.value.address_space           ##lookup(each.value, "address_space", [] ) optional Exactly one of address_space or ip_address_pool must be specified.
  dns_servers         = each.value.dns_servers               ## set condition blank [] in varaibal.tf]
  tags                = lookup(each.value, "tags", {} )  
  bgp_community       = lookup(each.value, "bgp_community", null)         ##optional-12076:51210 is central india bgp Community-kya -BGP based community tag jisse routing control hota hai.,kyu-ExpressRoute ya on-prem BGP routing me use hota hai,kab-Bohot rare — only when required by ISP or ExpressRoute team.
#   dynamic "ddos_protection_plan" {
#   for_each           = lookup(each.value, "ddos_protection_plan", null) != null ? [1] : []  ##Ye check karta hai ki user ne ddos_protection_plan diya hai ya nahi,Agar ddos_protection_plan exist karta hai to TRUE ,Agar TRUE → [1] → block 1 baar chalega ,Agar FALSE → [] → block bilkul nahi chalega

#   content {
#     id     = data.azurerm_ddos_protection_plan.ddos.id
#     enable = each.value.ddos_protection_plan.enable
#   }
# }

############         Dynamic Block    #####################
dynamic"encryption" {
  for_each = lookup(each.value , "encryption", {} )
  content {
    enforcement = encryption.value.enforcement
  }
  
}

  dynamic "subnet" {
    for_each = each.value.subnets != null ? each.value.subnets : {}        ## use of ternaory operator instaed of lookup also can use ,if use {} ke jagah null use karenge to fatenga 
 content {
    name           = subnet.value.name
    address_prefixes = subnet.value.address_prefixes
  }
  }
 dynamic "ip_address_pool" {
  for_each = lookup(each.value, "ip_address_pool", [] ) 
  content {
    id                     = ip_address_pool.value.id
    number_of_ip_addresses = ip_address_pool.value.number_of_ip_addresses
  }
}
}
  

  
