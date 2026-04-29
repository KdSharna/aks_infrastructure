output "db_connection_string" {
  value     = "Driver={ODBC Driver 18 for SQL Server};Server=tcp:${module.serversql.sql_fqdn["server1"]},1433;Database=${module.databasesql.db_name["database1"]};Uid=${var.serversql["server1"].administrator_login};Pwd=${var.serversql["server1"].administrator_login_password};Encrypt=yes;TrustServerCertificate=no;Connection Timeout=30;"
  sensitive = true
}