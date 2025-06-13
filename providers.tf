terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.23"
    }
    azurecaf = {
      source  = "claranet/azurecaf"
      version = "~> 1.2.29"
    }
    random = {
      source  = "hashicorp/random"
      version = ">= 2.0"
    }
  }
}
