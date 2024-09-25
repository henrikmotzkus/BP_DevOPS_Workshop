terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.3.0"
    }
    
  }

  backend "remote" {
    resource_group_name  = "BP_DevOPS-Workshop"
    storage_account_name = "henrikbpdevopsworkshop"
    container_name       = "tfstate"
    key                  = "terraform.tfstate"
    use_oidc             = true
  }
}



-backend-config="resource_group_name=BP_DevOPS-Workshop" -backend-config="storage_account_name = henrikbpdevopsworkshop" -backend-config="container_name=tfstate" -backend-config="key=terraform.tfstate" -backend-config="use_oidc=true" 