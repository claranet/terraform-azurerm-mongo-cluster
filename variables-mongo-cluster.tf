variable "administrator_username" {
  description = "The administrator username of the MongoDB Cluster."
  type        = string
  default     = null
}

variable "administrator_password" {
  description = "The Password associated with the administrator_username for the MongoDB Cluster. If not set, password is randomly generated."
  type        = string
  default     = null
  sensitive   = true
}

variable "shard_count" {
  description = "The Number of shards to provision on the MongoDB Cluster."
  type        = number
  default     = 1

  validation {
    condition     = var.shard_count >= 1 && var.shard_count <= 10
    error_message = "The shard_count must be between 1 and 10 (inclusive)."
  }
}

variable "compute_tier" {
  description = "The compute tier to assign to the MongoDB Cluster. Possible values are Free, M10, M20, M25, M30, M40, M50, M60, M80, and M200."
  type        = string
  default     = "Free"

  validation {
    condition = contains([
      "Free", "M10", "M20", "M25", "M30", "M40", "M50", "M60", "M80", "M200"
    ], var.compute_tier)
    error_message = "The compute_tier must be one of: Free, M10, M20, M25, M30, M40, M50, M60, M80, M200."
  }
  nullable = false
}

variable "high_availability_enabled" {
  description = "Whether the high availability is disabled or enabled (ZoneRedundantPreferred). Note: High availability is only available for M30 tier and above."
  type        = bool
  default     = false
}

variable "storage_size_in_gb" {
  description = "The size of the data disk space for the MongoDB Cluster. Valid values are: 32, 64, 128, 256, 512, 1024, 2048, 4096, 8192, 16384, 32768. Note: Free tier only supports 32 GiB, M10/M20/M25 tiers support 32, 64, or 128 GiB only, M30+ tiers support all values."
  type        = number
  default     = 32

  validation {
    condition     = contains([32, 64, 128, 256, 512, 1024, 2048, 4096, 8192, 16384, 32768], var.storage_size_in_gb)
    error_message = "The storage_size_in_gb must be one of the following values: 32, 64, 128, 256, 512, 1024, 2048, 4096, 8192, 16384, 32768."
  }
}

variable "create_mode" {
  description = "The creation mode for the MongoDB Cluster. Possible values are Default and GeoReplica."
  type        = string
  default     = "Default"

  validation {
    condition     = contains(["Default", "GeoReplica"], var.create_mode)
    error_message = "The create_mode must be either 'Default' or 'GeoReplica'."
  }
  nullable = false
}

variable "source_server_id" {
  description = "The ID of the replication source MongoDB Cluster. Required when create_mode is GeoReplica."
  type        = string
  default     = null
}

variable "source_location" {
  description = "The location of the source MongoDB Cluster. Required when create_mode is GeoReplica."
  type        = string
  default     = null
}

variable "preview_features" {
  description = "The preview features that can be enabled on the MongoDB Cluster."
  type        = list(string)
  default     = []
}

variable "mongodb_version" {
  description = "The version for the MongoDB Cluster. Possible values are 5.0, 6.0 and 7.0."
  type        = string
  default     = "7.0"

  validation {
    condition     = contains(["5.0", "6.0", "7.0"], var.mongodb_version)
    error_message = "The mongodb_version must be one of: 5.0, 6.0, 7.0."
  }
}
