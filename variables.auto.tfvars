#region Projuect Variables Commonly used in entire project
project_variables = {
  project     = "Kamm-dev"
  environment = "dev"
  # subscription_name = "GO-SM-KEI Mulesoft Research and POC"
  subscription_name = "GO-SM-Punit-DLH"
  location    = "East US"
  agent_count = 3
  dns_prefix  = "aks"
 # tenant_id   = "9f58333b-9cca-4bd9-a7d8-e151e43b79f3"
  
  subscription_ids = {
  #maas    = "8202efd8-1b9f-4133-ba1f-c1f643bb367f"
  
  }
  tags = {
    "CostCenter" = "Kamm"
    "TechnicalOwner" = "salidina"
    "TechnicalContact" = "salidina"
    "TechnicalLead" = "salidina"
    "Solution" = "Kamm"
    "Team" = "Kamm"
    "PermanentShutdown" = "None"
    "Schedule" = "None"
    "Environment" = "Dev"
  }
}
#endregion - added by Sheb - new branch POC - make changes on DevOps
#region Virtual Network 
vnet_variables = {
 "test" ={
  address_space = ["10.0.0.0/16"]
 }
  "vnet-ag" ={
  address_space = ["11.0.0.0/16"]
 }
}
subnet_variables = {
  "one" = {
    vnet = "test"
    subnet_address_prefix = ["10.0.1.0/24"]
  }
  "sn-ag" = {
    vnet = "vnet-ag"
    subnet_address_prefix = ["11.0.1.0/24"]
  }
}
#endregion

#region Virtual machine

# Azure Public IP variables
public_ips = {
  test = {
    allocation_method = "Static"
    sku = "Basic"
  }
}

# Azure Network interface variables
network_interfaces = {
  test = {
    snet = "one"
    pip = "test"
    nsg = "test"
  }
}

# Azure Network Security group
network_security_groups = {
  test = {
    security_rules = {
      "RDP" = {
        priority = 300
        direction = "Inbound"
        access = "Allow"
        protocol = "Tcp"
        source_port_range = "*"
        destination_port_range = "3389"
        source_address_prefix = "*"
        destination_address_prefix = "*"
      }
    }
  }
}

# Azure Virual machine variables
windows_vm = {
  "test" = {
      size                = "Standard_DS1_v2"//"Standard_F2"
      admin_username      = "adminuser"
      admin_password      = "1111P@$$w0rd1234!"
      nic ="test"
      caching              = "ReadWrite"
      storage_account_type = "Standard_LRS"
      publisher = "MicrosoftWindowsServer"
      offer     = "WindowsServer"
      sku       = "2016-Datacenter"
      version   = "latest"
  }
}
az_sqlserver = {
    name                       = "kamm-sqlserver"
    version                      = "12.0"
    administrator_login          = "4dm1n157r470r"
    administrator_login_password = "4-v3ry-53cr37-p455w0rd"
}

az_sqldatabase = {
    name                       = "kammdb"
    collation      = "SQL_Latin1_General_CP1_CI_AS"
    license_type   = "LicenseIncluded"
    max_size_gb    = 5
    read_scale     = false
    sku_name       = "S0"
    zone_redundant = false
    }

# Azure Postgresql variables
# We can replace test with actual resource names
az_postgresql = {
  test = {
      size                = "102400"
      admin_username      = "sqladmin"
      admin_password      = "jovaL1!x42"
      version             = "11"
  }
}
#endregion


//name = "ci360dev-app-gateway"
//
//backend_address_pool = {
//  name = "ci360dev-backend-address-pool"
//}

//backend_http_settings = {
//  cookie_based_affinity = "Disabled"
//  name = "ci360dev-backend-http-settings"
//  port = 80
//  protocol = "Http"
//  request_timeout = 60
//}

//frontend_ip_configuration = {
//  name = "ci360dev-frontend-ip-config"
//}

//frontend_port = {
//  name = "ci360dev-frontend-port"
//  port = 80
//}

//gateway_ip_configuration = {
//  name = "ci360dev-gateway-ip-config"
//}

//http_listener = {
//  name = "ci360dev-http-listener"
//  protocol = "Http"
//}

//request_routing_rule = {
// name = "ci360dev-request-route-rule"
//  rule_type = "Basic"
//}

//sku = {
//  capacity = 2
//  name = "Standard_Small"
//  tier = "Standard"
//}

//public_ip_name = "ci360dev-public-ip"

app_gateways = {
  ag-ci360 = {
    name = "ag-devuslab-ci360dev"
    frontend_ip_configuration_name = "ag-frontend-ip-config"
    frontend_port = {
      listener_admin = {
        name = "ag-frontend-port_443"
        port = "443"
      }
      listener_app = {
        name = "ag-frontend-port_442"
        port = "442"
      }      
    }
    gateway_ip_configuration_name = "ag-gateway-ip-config"
    sku_capacity = 2
    sku_name     = "Standard_v2"
    sku_tier     = "Standard_v2"
    public_ip_index = "ag_pip"
    backend_http_settings = {
      http_settings_80 = {
        cookie_based_affinity = "Disabled"
        name                  = "ag-backend-http-settings"
        port                  = 80
        protocol              = "Http"
        request_timeout       = 60
      }
    }
    request_routing_rule = {
      listener_admin = {
        name      = "ag-request-route-rule_admin"
        rule_type = "Basic"
        http_listener_name = "ag-https-listener-admin.ci360dev"
        backend_address_pool_name = "ag-backend-address-pool"
        backend_http_settings_name = "ag-backend-http-settings"
      },
      listener_app = {
        name      = "ag-request-route-rule_app"
        rule_type = "Basic"
        http_listener_name = "ag-https-listener-app.ci360dev"
        backend_address_pool_name = "ag-backend-address-pool"
        backend_http_settings_name = "ag-backend-http-settings"
      }
    }
http_listener = {
  listener_admin = {
  name                           = "ag-https-listener-admin.ci360dev"
  protocol                       = "Https"
  frontend_ip_configuration_name = "ag-frontend-ip-config"
  frontend_port_name             = "ag-frontend-port_443"
  host_name                      = "admin.ci360dev.us.kworld.kpmg.com"
  ssl_certificate_name           = "admin.ci360dev"
  },
  listener_app = {
    name                           = "ag-https-listener-app.ci360dev"
    protocol                       = "Https"
    frontend_ip_configuration_name = "ag-frontend-ip-config"
    frontend_port_name             = "ag-frontend-port_442"
    host_name                      = "app.ci360dev.us.kworld.kpmg.com"
    ssl_certificate_name           = "app.ci360dev"
}
  }
    ssl_certificates = {
      listener_admin = {
        name = "admin.ci360dev"
        key_vault_secret_id = "admin-ci360dev"
      }
      listener_app = {
        name = "app.ci360dev"
        key_vault_secret_id = "app-ci360dev"
      }
    }
    backend_address_pool = {
      add_pool_default = {
        name = "ag-backend-address-pool"
      }
    }
  }
}

public_ip = {
  ag_pip = {
    name =  "ag-public-ip"
    allocation_method = "Static"
    rg-index= "rg-ag"
  }
}
keyvault_variables = {
  keyvault = {
    "appgateway" = {}
  }
  certificates = {
    "admin-ci360dev" = {
      kv = "appgateway"
    }
    "app-ci360dev"  = {
      kv = "appgateway"
    }
  }
}


#endregion