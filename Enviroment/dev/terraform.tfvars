rg_details = {
  rg1 = {
    rg_name = "asku_rg"
    location = "centralindia"
    managed_by = "asku"
    tags = {
        enviroment = "dev"
        owner = "ashique"
    }
    },
    rg2 = {
    rg_name = "aski_rg"
    location = "centralindia"
    managed_by = "asku"
    tags = {
        enviroment = "dev"
        owner = "ashique"
    }
    } 
  }

stg_details = {
  "stg1" = {
    stg_name = "askustg"
    rg_name = "asku_rg"
    location = "centralindia"
    account_tier = "Standard"
    account_replication_type = "GRS"
   tags = {
    environment = "dev"
    owner= "asku"
   }
   account_kind = "BlobStorage"
  }
}

vnet_details = {
  "vnet1" = {
    vnet_name = "asku_vnet"
    location = "centralindia"
    rg_name = "asku_rg"
    address_space  = ["10.0.0.0/16"]
    dns_servers = ["10.0.0.4", "10.0.0.5"]
    tags = {
      environment = "dev"
       owner= "asku"
    }
    ip_address_pool = []

    subnets = {
      subnet1 = {
        name             = "frontend_subnet"
      address_prefixes = ["10.0.1.0/24"]
        }
        subnet2 = {
          name             = "backend_subnet"
      address_prefixes = ["10.0.2.0/24"]
      }
      subnet3 = {
        name             = "AzureBastionSubnet"
      address_prefixes = ["10.0.3.0/24"]
      }
    }
     bgp_community = "12076:51210"
#  ddos_protection_plan = null                ##  # ❗ Ye sahi hai (DDoS OFF)
encryption = {
  enc1 = {
    enforcement = "AllowUnencrypted"
  }
}
  }
}

pip_details = {
  pip1 = {
    pip_name = "frontend_pip"
    rg_name = "asku_rg"
    location = "centralindia"
    allocation_method = "Static"
    tags = {
      environment = "dev"
      owner = "asku"
    }
  },
   pip2 = {
    pip_name = "backend_pip"
    rg_name = "asku_rg"
    location = "centralindia"
    allocation_method = "Static"
    tags = {
      environment = "dev"
      owner = "asku"
    }
  }
}

vms = {
  vm1 = {
    nic_name = "frontend_nic"
    subnet_name = "frontend_subnet"
    pip_name = "frontend_pip"
    vnet_name = "asku_vnet"
    vm_name = "frontend-vm"
    rg_name = "asku_rg"
    location = "centralindia"
    size = "Standard_F2"
    admin_username = "Asku"
    admin_password = "Asku@123456"
    disable_password_authentication = false
    os_disk = {
      caching = "ReadWrite"
      storage_account_type = "Standard_LRS"
    }
      source_image_reference = {
        publisher = "Canonical"
        offer = "0001-com-ubuntu-server-jammy"
        sku = "22_04-lts"
        version = "latest"
      }
    } ,
    vm2 = {
    nic_name = "backend_nic"
    subnet_name = "backend_subnet"
    pip_name = "backend_pip"
    vnet_name = "asku_vnet"
    vm_name = "backend-vm"
    rg_name = "asku_rg"
    location = "centralindia"
    size = "Standard_F2"
    admin_username = "Asku"
    admin_password = "Asku@123456"
    disable_password_authentication = false
    os_disk = {
      caching = "ReadWrite"
      storage_account_type = "Standard_LRS"
    }
      source_image_reference = {
        publisher = "Canonical"
        offer = "0001-com-ubuntu-server-jammy"
        sku = "22_04-lts"
        version = "latest"
      }

  }
}

key_vaults = {
  k1 = {
    kv_name = "value"
    location                    = "centralindia"
  rg_name         = "asku_rg"
    enabled_for_disk_encryption = true
    tenant_id                   = "308cf1f9-a8ab-4d6c-8f2d-e645787abd05"
    soft_delete_retention_days  = 7
    purge_protection_enabled    = true
    sku_name                    = "standard"
    access_policies = {
      a1 = {
        tenant_id = "308cf1f9-a8ab-4d6c-8f2d-e645787abd05"
        object_id = "da34a4ae-5c4b-4e88-a360-23fd6290b810"

        key_permissions     = ["Get"]
        secret_permissions  = ["Get"]
        storage_permissions = ["Get"]
      }
    }
  }
}