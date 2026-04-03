name_rg = {
  rg1 = {
    name       = "tanduri"
    location   = "west us"
    managed_by = "terraform"
    tags = {
      cost_center = "dev"
    }
  }
  #   rg2 = {
  #     name       = "tanduri1"
  #     location   = "east us2"
  #     managed_by = "terraform"
  #   }
}


cluster_ks = {
  aks11 = {
    name                = "k8s_cluster"
    location            = "west us"
    resource_group_name = "tanduri"
    dns_prefix          = "aks0101"
  }
}

default_node_pool = {
  node_pool1 = {
    name       = "default"
    node_count = 1
    vm_size    = "Standard_D2s_v3"
  }
}

azure_acr = {
  acr1 = {
    name                = "akscon1"
    resource_group_name = "tanduri"
    location            = "west us"
    sku                 = "Premium"
    admin_enabled       = false
  }
}

georeplications = {
  georeplica1 = {
    location                = "east us"
    zone_redundancy_enabled = true
  }
  georeplica2 = {
    location                = "North Europe"
    zone_redundancy_enabled = false
  }
}

serversql = {
  server1 = {
    name                         = "mysqlservertittu1234"
    resource_group_name          = "tanduri"
    location                     = "west us"
    version                      = "12.0"
    administrator_login          = "Tattu01!@"
    administrator_login_password = "Tattu!12345"
    minimum_tls_version          = "1.2"

  }
}

databasesql = {
  database1 = {
    name         = "mysqldatabased"
    sql_name     = "mysqlservertittu1234"
    collation    = "SQL_Latin1_General_CP1_CI_AS"
    license_type = "LicenseIncluded"
    max_size_gb  = 2
    sku_name     = "S0"
    enclave_type = "VBS"
    rg_name      = "tanduri"
  }
}