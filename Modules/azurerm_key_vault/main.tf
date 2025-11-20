resource "azurerm_key_vault" "kv" {
  for_each = var.key_vaults
  name                        = each.value.kv_name
  location                    = each.value.location
  resource_group_name         = each.value.rg_name
  enabled_for_disk_encryption = each.value.enabled_for_disk_encryption
  tenant_id                   = data.azurerm_client_config.current.tenant_id   # KV kis tenant ka hai — yaha tumhara login wala.
  soft_delete_retention_days  = each.value.soft_delete_retention_days
  purge_protection_enabled    = false                                         #⚠ Production me hamesha purge_protection_enabled = true rakha jata hai.

  sku_name = "standard"

  access_policy {
    tenant_id = data.azurerm_client_config.current.tenant_id                 #Tumhara Azure tenant.
    object_id = data.azurerm_client_config.current.object_id                 #Tumhara Azure AD user ka object id./Matlab tum user ko KV me access dene wale ho.

    key_permissions = [
      "Get",
    ]

    secret_permissions = [                                                     
      "Get",
    ]

    storage_permissions = [
      "Get",
    ]
  }
}