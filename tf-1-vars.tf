variable "resource_group_name" {
    type = string
    default = "rg-terraform-github-actions"
}

variable "location" {
    type = string
    default = "northeurope"
}

variable "tags" {
    type = map(string)
    default = {
        deployment = "tf"
    }
}

variable "snets" {
    type = map(object({
            name = string
            address_prefixes = list(string)
        }
    ))
    default = {
        subnet1 = {
            name             = "snet-1"
            address_prefixes = ["10.0.0.0/24"]
        }
        subnet2 = {
            name             = "snet-2"
            address_prefixes = ["10.0.1.0/24"]
        } 
        AzureFirewallSubnet = {
            name            = "AzureFirewallSubnet"
            address_prefixes = ["10.0.2.0/24"]
        }
    }
}

