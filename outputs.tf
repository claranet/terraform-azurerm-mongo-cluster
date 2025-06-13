output "resource" {
  description = "MongoDB Cluster resource object."
  value       = local.mongo_cluster_resource
}

output "id" {
  description = "MongoDB Cluster ID."
  value       = local.mongo_cluster_resource.id
}

output "name" {
  description = "MongoDB Cluster name."
  value       = local.mongo_cluster_resource.name
}

output "connection_strings" {
  description = "The list of connection strings for the MongoDB Cluster."
  value       = local.mongo_cluster_resource.connection_strings
}

output "administrator_login" {
  description = "The administrator login for the MongoDB Cluster."
  value       = var.administrator_username
}

output "administrator_password" {
  description = "The administrator password for the MongoDB Cluster."
  value       = local.administrator_password
  sensitive   = true
}
