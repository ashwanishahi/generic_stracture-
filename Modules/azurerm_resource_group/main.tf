resource "azurerm_resource_group" "rg1" {
  for_each   = var.rg_details
  name       = each.value.rg_name
  location   = each.value.location
  managed_by = lookup(each.value , "managed_by" , {})  
  # lookup() safe way hai key fetch karne ka,Agar tfvars me "managed_by" diya hai to uska value lega,Agar nahi diya hai to {} (empty) return karega
  
  tags = merge(                                    # merge() do maps ko jodta hai
    lookup(each.value ,"tags" ,{} ) ,              # tfvars me jo tags diye hai unhe first map ki tarah lo
    {                                              # second map me hum apne system-defined tags add karenge
      created_on = timestamp()                     # har RG automatically timestamp tag lega
    }
    # merge() dono maps ko combine karega => final tags = tfvars tags + created_on
  )
  lifecycle {
    prevent_destroy       = false                  # RG ko destroy karne ki अनुमति (true karte to destroy block ho jata)
    create_before_destroy = true                   # pehle new RG create hoga phir old destroy — downtime avoid karta hai
  }
}
