resource "azurerm_storage_account" "stg" {
  for_each = var.stg_details
  name                     = each.value.stg_name
  resource_group_name      = each.value.rg_name
  location                 = each.value.location
  account_tier             = each.value.account_tier
  account_replication_type = each.value.account_replication_type
 
  tags = lookup(each.value , "tags", {} )

#### OPtionals #################
 account_kind = lookup(each.value, "account_kind", "StorageV2")
  access_tier  = lookup(each.value, "access_tier",  "Hot")
  edge_zone = lookup(each.value , "centralindia" , null ) 
  min_tls_version = each.value.min_tls_version != null ? each.value.min_tls_version : "TLS1_2"
  dynamic "network_rules" {
    for_each =  lookup(each.value, "network_rules", null) != null ? [each.value.network_rules] : []
   content {
     default_action = lookup(network_rules.value , "default_action" , "allow")
         bypass =     lookup(network_rules.value , "bypass" , "None" )
   }
   
  }
    
  }
