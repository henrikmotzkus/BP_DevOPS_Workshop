terraform {
    required_providers {
        azurerm = {
            source  = "hashicorp/azurerm"
            version = "4.3.0"
        }
    }

    backend "azurerm" {
        resource_group_name  = "RG_BP_TF_State_Prod"
        storage_account_name = "henrikbpdevopsworkshop"
        container_name       = "tfstate"
        key                  = "terraform.tfstate"
        use_oidc             = true
    }
}

provider "azurerm" {
  features {}
  use_oidc = true
  subscription_id = "05e45818-2478-475f-87d8-4c8cf13455c0"
}
