terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.7.1"
    }
    azapi = {
      source = "azure/azapi"
      version = "2.0.0-beta"
    }
    modtm = {
      source = "Azure/modtm"
      version = "0.3.2"
    }
    random = {
      source = "hashicorp/random"
      version = "3.6.3"
    }
  }

  # Update this block with the location of your terraform state file
  backend "azurerm" {
    resource_group_name  = "BP_DevOPS-Workshop"
    storage_account_name = "henrikbpdevopsworkshop"
    container_name       = "tfstate"
    key                  = "terraform.tfstate"
    use_oidc             = true
  }
}

provider "azurerm" {
  features {}
  use_oidc = true
}

provider "azapi" {
  use_oidc  = true
}

provider "modtm" {
  # Configuration options
}

provider "random" {
  # Configuration options
}