terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.3.0"
    }
    }
}

provider "azurerm" {
  features {}
  use_oidc = true
  subscription_id = "05e45818-2478-475f-87d8-4c8cf13455c0"
}
