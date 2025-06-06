output "resource" {
  description = "MongoDB Cluster resource object."
  value       = azurerm_mongo_cluster.main
}

output "id" {
  description = "MongoDB Cluster ID."
  value       = azurerm_mongo_cluster.main.id
}

output "name" {
  description = "MongoDB Cluster name."
  value       = azurerm_mongo_cluster.main.name
}

output "identity_principal_id" {
  description = "MongoDB Cluster system identity principal ID."
  value       = try(azurerm_mongo_cluster.main.identity[0].principal_id, null)
}

output "module_diagnostics" {
  description = "Diagnostics settings module outputs."
  value       = module.diagnostics
}
