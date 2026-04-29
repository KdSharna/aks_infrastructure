output "sql_fqdn" {
  value = {
    for k, v in azurerm_mssql_server.sqlserver :
    k => v.fully_qualified_domain_name
  }
}