module "avm-res-network-virtualnetwork" {
  source = "Azure/avm-res-network-virtualnetwork/azurerm"
  address_space      = ["10.0.0.0/16"]
  location            = "North Europe"
  name                = "VNET-HUB"
  resource_group_name = var.resource_group_name
  subnets = {
    "subnet1" = {
      name             = "snet-1"
      address_prefixes = ["10.0.0.0/24"]
    }
    "subnet2" = {
      name             = "snet-2"
      address_prefixes = ["10.0.1.0/24"]
    }
  }
}