data "azurecaf_name" "mongo_cluster" {
  name          = var.stack
  resource_type = "azurerm_cosmosdb_account" # Using CosmosDB Account as a proxy for MongoDB Cluster naming
  prefixes      = local.name_prefix == "" ? [local.default_name_prefix] : [local.name_prefix]
  suffixes      = compact([var.client_name, var.location_short, var.environment, local.name_suffix])
  use_slug      = true
  clean_input   = true
  separator     = "-"
}
