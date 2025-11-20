module "rgcalling" {
  source     = "../../Modules/azurerm_resource_group"
  rg_details = var.rg_details

}

module "stgcalling" {
  source     = "../../Modules/azurerm_storage_account"
  stg_details = var.stg_details

}

module "vnetcalling" {
  depends_on = [ module.rgcalling ]
  source = "../../Modules/networking"
  vnet_details = var.vnet_details
  
}
module "pipcalling" {
  depends_on = [ module.vnetcalling ]
  source = "../../Modules/azurerm_public_ip"
  pip_details = var.pip_details
}


module "vmcalling" {
  depends_on = [ module.pipcalling ,module.vnetcalling ]
  source = "../../Modules/compute"
  vms = var.vms
  
}
module "kvcalling" {
  source = "../../Modules/azurerm_key_vault"
  key_vaults = var.key_vaults
  
}