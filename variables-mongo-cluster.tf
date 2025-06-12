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
  type        = string
  default     = "1"
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
}

variable "high_availability_mode" {
  description = "The high availability mode for the MongoDB Cluster. Possible values are Disabled and ZoneRedundantPreferred. Note: High availability is only available for M30 tier and above."
  type        = string
  default     = "Disabled"

  validation {
    condition     = contains(["Disabled", "ZoneRedundantPreferred"], var.high_availability_mode)
    error_message = "The high_availability_mode must be either 'Disabled' or 'ZoneRedundantPreferred'."
  }
}

variable "storage_size_in_gb" {
  description = "The size of the data disk space for the MongoDB Cluster."
  type        = string
  default     = "32"
}

variable "create_mode" {
  description = "The creation mode for the MongoDB Cluster. Possible values are Default and GeoReplica."
  type        = string
  default     = "Default"

  validation {
    condition     = contains(["Default", "GeoReplica"], var.create_mode)
    error_message = "The create_mode must be either 'Default' or 'GeoReplica'."
  }
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

variable "public_network_access" {
  description = "The Public Network Access setting for the MongoDB Cluster. Possible values are Disabled and Enabled."
  type        = string
  default     = "Enabled"

  validation {
    condition     = contains(["Disabled", "Enabled"], var.public_network_access)
    error_message = "The public_network_access must be either 'Disabled' or 'Enabled'."
  }
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
