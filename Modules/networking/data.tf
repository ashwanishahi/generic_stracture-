######AzureRM provider me DDoS plan ke liye koi data source hota hi nahi.Isliye tum data block use karoge to always fat jayega



# data "azurerm_ddos_protection_plan" "ddos" {
#   name                = "ddos_plan"          # existing plan ka naam
#   resource_group_name = "asku_rg"            # jisme DDoS plan bana hua hai
# }