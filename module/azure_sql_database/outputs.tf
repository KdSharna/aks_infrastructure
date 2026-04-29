output "db_name" {
  value = {
    for k, v in azurerm_mssql_database.sqldatabase :
    k => v.name
  }
}