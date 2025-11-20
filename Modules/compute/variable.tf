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
