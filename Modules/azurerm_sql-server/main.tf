resource "azurerm_mssql_server" "sqlserver" {
  for_each = var.sqlserver
  name                         = each.value.sqlserver_name
  resource_group_name          = each.value.rg_name
  location                     = each.value.location
  version                      = "12.0"
  administrator_login          = "missadministrator"
  administrator_login_password = "thisIsKat11"
  minimum_tls_version          = "1.2"

  azuread_administrator {
    login_username = "AzureAD Admin"
    object_id      = "00000000-0000-0000-0000-000000000000"
  }



tags = merge(
  lookup(each.value.tags , "tags" ,{}) ,
  {
    created_on = timestamp
  }
)
}
  