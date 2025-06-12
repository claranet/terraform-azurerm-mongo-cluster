# MongoDB Cluster
[![Changelog](https://img.shields.io/badge/changelog-release-green.svg)](CHANGELOG.md) [![Notice](https://img.shields.io/badge/notice-copyright-blue.svg)](NOTICE) [![Apache V2 License](https://img.shields.io/badge/license-Apache%20V2-orange.svg)](LICENSE) [![OpenTofu Registry](https://img.shields.io/badge/opentofu-registry-yellow.svg)](https://search.opentofu.org/module/claranet/mongo-cluster/azurerm/latest)

Azure module to deploy a [MongoDB Cluster using vCore Architecture](https://docs.microsoft.com/en-us/azure/cosmos-db/mongodb/vcore/).

<!-- BEGIN_TF_DOCS -->
## Global versioning rule for Claranet Azure modules

| Module version | Terraform version | OpenTofu version | AzureRM version |
| -------------- | ----------------- | ---------------- | --------------- |
| >= 8.x.x       | **Unverified**    | 1.8.x            | >= 4.0          |
| >= 7.x.x       | 1.3.x             |                  | >= 3.0          |
| >= 6.x.x       | 1.x               |                  | >= 3.0          |
| >= 5.x.x       | 0.15.x            |                  | >= 2.0          |
| >= 4.x.x       | 0.13.x / 0.14.x   |                  | >= 2.0          |
| >= 3.x.x       | 0.12.x            |                  | >= 2.0          |
| >= 2.x.x       | 0.12.x            |                  | < 2.0           |
| <  2.x.x       | 0.11.x            |                  | < 2.0           |

## Contributing

If you want to contribute to this repository, feel free to use our [pre-commit](https://pre-commit.com/) git hook configuration
which will help you automatically update and format some files for you by enforcing our Terraform code module best-practices.

More details are available in the [CONTRIBUTING.md](./CONTRIBUTING.md#pull-request-process) file.

## Usage

This module is optimized to work with the [Claranet terraform-wrapper](https://github.com/claranet/terraform-wrapper) tool
which set some terraform variables in the environment needed by this module.
More details about variables set by the `terraform-wrapper` available in the [documentation](https://github.com/claranet/terraform-wrapper#environment).

⚠️ Since modules version v8.0.0, we do not maintain/check anymore the compatibility with
[Hashicorp Terraform](https://github.com/hashicorp/terraform/). Instead, we recommend to use [OpenTofu](https://github.com/opentofu/opentofu/).

```hcl
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
```

## Providers

| Name | Version |
|------|---------|
| azurecaf | ~> 1.2.29 |
| azurerm | >= 4.23 |
| random | >= 2.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| diagnostics | claranet/diagnostic-settings/azurerm | ~> 8.0 |

## Resources

| Name | Type |
|------|------|
| [azurerm_mongo_cluster.main](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/mongo_cluster) | resource |
| [azurerm_mongo_cluster.replica](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/mongo_cluster) | resource |
| [random_password.administrator_password](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/password) | resource |
| [azurecaf_name.mongo_cluster](https://registry.terraform.io/providers/claranet/azurecaf/latest/docs/data-sources/name) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| administrator\_password | The Password associated with the administrator\_username for the MongoDB Cluster. If not set, password is randomly generated. | `string` | `null` | no |
| administrator\_username | The administrator username of the MongoDB Cluster. | `string` | `null` | no |
| client\_name | Client name/account used in naming. | `string` | n/a | yes |
| compute\_tier | The compute tier to assign to the MongoDB Cluster. Possible values are Free, M10, M20, M25, M30, M40, M50, M60, M80, and M200. | `string` | `"Free"` | no |
| create\_mode | The creation mode for the MongoDB Cluster. Possible values are Default and GeoReplica. | `string` | `"Default"` | no |
| custom\_name | Custom MongoDB Cluster, generated if not set. | `string` | `""` | no |
| default\_tags\_enabled | Option to enable or disable default tags. | `bool` | `true` | no |
| diagnostic\_settings\_custom\_name | Custom name of the diagnostics settings, name will be `default` if not set. | `string` | `"default"` | no |
| environment | Project environment. | `string` | n/a | yes |
| extra\_tags | Additional tags to add on resources. | `map(string)` | `{}` | no |
| high\_availability\_mode | The high availability mode for the MongoDB Cluster. Possible values are Disabled and ZoneRedundantPreferred. Note: High availability is only available for M30 tier and above. | `string` | `"Disabled"` | no |
| location | Azure region to use. | `string` | n/a | yes |
| location\_short | Short string for Azure location. | `string` | n/a | yes |
| logs\_categories | Log categories to send to destinations. | `list(string)` | `null` | no |
| logs\_destinations\_ids | List of destination resources IDs for logs diagnostic destination.<br/>Can be `Storage Account`, `Log Analytics Workspace` and `Event Hub`. No more than one of each can be set.<br/>If you want to use Azure EventHub as a destination, you must provide a formatted string containing both the EventHub Namespace authorization send ID and the EventHub name (name of the queue to use in the Namespace) separated by the <code>&#124;</code> character. | `list(string)` | n/a | yes |
| logs\_metrics\_categories | Metrics categories to send to destinations. | `list(string)` | `null` | no |
| mongodb\_version | The version for the MongoDB Cluster. Possible values are 5.0, 6.0 and 7.0. | `string` | `"7.0"` | no |
| name\_prefix | Optional prefix for the generated name. | `string` | `""` | no |
| name\_suffix | Optional suffix for the generated name. | `string` | `""` | no |
| preview\_features | The preview features that can be enabled on the MongoDB Cluster. | `list(string)` | `[]` | no |
| public\_network\_access | The Public Network Access setting for the MongoDB Cluster. Possible values are Disabled and Enabled. | `string` | `"Enabled"` | no |
| resource\_group\_name | Name of the resource group. | `string` | n/a | yes |
| shard\_count | The Number of shards to provision on the MongoDB Cluster. | `string` | `"1"` | no |
| source\_location | The location of the source MongoDB Cluster. Required when create\_mode is GeoReplica. | `string` | `null` | no |
| source\_server\_id | The ID of the replication source MongoDB Cluster. Required when create\_mode is GeoReplica. | `string` | `null` | no |
| stack | Project stack name. | `string` | n/a | yes |
| storage\_size\_in\_gb | The size of the data disk space for the MongoDB Cluster. | `string` | `"32"` | no |

## Outputs

| Name | Description |
|------|-------------|
| administrator\_login | The administrator login for the MongoDB Cluster. |
| administrator\_password | The administrator password for the MongoDB Cluster. |
| connection\_strings | The list of connection strings for the MongoDB Cluster. |
| id | MongoDB Cluster ID. |
| name | MongoDB Cluster name. |
| resource | MongoDB Cluster resource object. |
<!-- END_TF_DOCS -->

## Related documentation

Microsoft Azure documentation: [Azure Cosmos DB for MongoDB vCore](https://docs.microsoft.com/en-us/azure/cosmos-db/mongodb/vcore/)
