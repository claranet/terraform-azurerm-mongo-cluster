module "diagnostics" {
  source  = "claranet/diagnostic-settings/azurerm"
  version = "~> 8.0"

  resource_id = local.mongo_cluster_resource.id

  logs_destinations_ids = var.logs_destinations_ids
  log_categories        = var.logs_categories
  metric_categories     = var.logs_metrics_categories

  custom_name = var.diagnostic_settings_custom_name
  name_prefix = var.name_prefix
  name_suffix = var.name_suffix
}
