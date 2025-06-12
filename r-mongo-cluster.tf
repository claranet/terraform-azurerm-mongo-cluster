resource "random_password" "administrator_password" {
  count = var.administrator_password == null && var.create_mode == "Default" ? 1 : 0

  length           = 16
  special          = true
  upper            = true
  lower            = true
  numeric          = true
  override_special = "!$#%&*()-_=+[]{}<>:?"
}

# MongoDB Cluster for Default mode (read-write)
resource "azurerm_mongo_cluster" "main" {
  count = var.create_mode == "Default" ? 1 : 0

  name                = local.name
  location            = var.location
  resource_group_name = var.resource_group_name

  administrator_username = var.administrator_username
  administrator_password = local.administrator_password
  create_mode            = var.create_mode
  shard_count            = var.shard_count
  compute_tier           = var.compute_tier
  high_availability_mode = local.high_availability_mode
  storage_size_in_gb     = var.storage_size_in_gb
  version                = var.mongodb_version
  preview_features       = var.preview_features

  public_network_access = var.public_network_access

  tags = merge(local.default_tags, var.extra_tags)
}

# MongoDB Cluster for GeoReplica mode (read-only replica)
resource "azurerm_mongo_cluster" "replica" {
  count = var.create_mode == "GeoReplica" ? 1 : 0

  name                = local.name
  location            = var.location
  resource_group_name = var.resource_group_name

  create_mode      = var.create_mode
  source_server_id = var.source_server_id
  source_location  = var.source_location

  public_network_access = var.public_network_access

  tags = merge(local.default_tags, var.extra_tags)

  lifecycle {
    ignore_changes = [
      administrator_username,
      high_availability_mode,
      preview_features,
      shard_count,
      storage_size_in_gb,
      compute_tier,
      version
    ]
  }
}
