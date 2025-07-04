locals {
  # Naming locals/constants
  name_prefix = lower(var.name_prefix)
  name_suffix = lower(var.name_suffix)

  default_name_prefix = "mongo"

  name = coalesce(var.custom_name, data.azurecaf_name.mongo_cluster.result)
}
