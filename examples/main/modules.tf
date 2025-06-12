module "mongo_cluster" {
  source  = "claranet/mongo-cluster/azurerm"
  version = "x.x.x"

  location            = module.azure_region.location
  location_short      = module.azure_region.location_short
  resource_group_name = module.rg.name

  client_name = var.client_name
  environment = var.environment
  stack       = var.stack

  administrator_username = "claranet"
  shard_count            = "1"
  compute_tier           = "Free"
  high_availability_mode = "Disabled"
  storage_size_in_gb     = "32"
  mongodb_version        = "7.0"

  public_network_access = "Enabled"

  logs_destinations_ids = [
    module.run.logs_storage_account_id,
    module.run.log_analytics_workspace_id
  ]

  extra_tags = {
    foo = "bar"
  }
}

module "mongo_cluster_replica" {
  source  = "claranet/mongo-cluster/azurerm"
  version = "x.x.x"

  location            = module.azure_region.paired_location.location
  location_short      = module.azure_region.paired_location.location_short
  resource_group_name = module.rg_paired.name

  client_name = var.client_name
  environment = var.environment
  stack       = var.stack

  create_mode      = "GeoReplica"
  source_server_id = module.mongo_cluster.id
  source_location  = module.azure_region.location

  public_network_access = "Enabled"

  logs_destinations_ids = [
    module.run.logs_storage_account_id,
    module.run.log_analytics_workspace_id
  ]

  extra_tags = {
    foo = "bar"
  }
}
