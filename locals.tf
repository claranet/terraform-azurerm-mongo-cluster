locals {
  administrator_password = (var.create_mode == "Default" ? coalesce(var.administrator_password, one(random_password.administrator_password[*].result)) : var.administrator_password)
  high_availability_mode = var.high_availability_enabled && contains(["M30", "M40", "M50", "M60", "M80", "M200"], var.compute_tier) ? "ZoneRedundantPreferred" : "Disabled"
  mongo_cluster_resource = var.create_mode == "Default" ? one(azurerm_mongo_cluster.main[*]) : one(azurerm_mongo_cluster.replica[*])
  geo_replica_sources_provided = (
    var.source_server_id != null && var.source_server_id != "" &&
    var.source_location != null && var.source_location != ""
  )
}
