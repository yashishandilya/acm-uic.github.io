terraform {
  backend "azurerm" {
    resource_group_name  = "acm-hybridcloud"
    storage_account_name = "acmhybridstore"
    container_name       = "acm-terraform-state"
    key                  = "typesense.tfstate"
    snapshot             = true
  }
  required_providers {
    shell = {
      source  = "linyinfeng/shell"
      version = "1.7.12"
    }
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.49.0"
    }
    github = {
      source  = "integrations/github"
      version = "5.18.3"
    }
  }
}

provider "github" {
  owner = "acm-uic"
}

provider "azurerm" {
  features {}
}

provider "shell" {
  interpreter        = ["/bin/bash", "-c"]
  enable_parallelism = false
}