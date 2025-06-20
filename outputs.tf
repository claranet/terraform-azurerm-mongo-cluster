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

output "global_readwrite_connection_string" {
  description = "The Global ReadWrite connection string for the MongoDB Cluster."
  value       = try([for cs in local.mongo_cluster_resource.connection_strings : cs.value if cs.name == "GlobalReadWrite"][0], "")
  sensitive   = true
}

output "self_connection_string" {
  description = "The Self connection string for the MongoDB Cluster."
  value       = try([for cs in local.mongo_cluster_resource.connection_strings : cs.value if cs.name == "Self"][0], "")
  sensitive   = true
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
