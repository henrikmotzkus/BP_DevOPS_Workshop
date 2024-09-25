resource "azurerm_virtual_network" "vnet" {
  name                  = "VNET-Hub"
  location              = azurerm_resource_group.rghubnetworking.location
  resource_group_name   = azurerm_resource_group.rghubnetworking.name
  address_space         = ["10.0.0.0/16"]
  #dns_servers           = ["10.0.0.4", "10.0.0.5"]
  tags = var.tags
}

resource "azurerm_subnet" "gatewaysubnet" {
  name                 = "GatewaySubnet"
  resource_group_name  = azurerm_resource_group.rghubnetworking.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = ["10.0.1.0/24"]
  
}

resource "azurerm_subnet" "firewallsubnet" {
  name                 = "AzureFirewallSubnet"
  resource_group_name  = azurerm_resource_group.rghubnetworking.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = ["10.0.2.0/24"]
}

resource "azurerm_network_security_group" "gw-subnet-nsg" {
  name                = "nsg-gw-subnet"
  location            = azurerm_resource_group.rghubnetworking.location
  resource_group_name = azurerm_resource_group.rghubnetworking.name
}




resource "azurerm_network_security_group" "fw-subnet-nsg" {
  name                = "nsg-fw-subnet"
  location            = azurerm_resource_group.rghubnetworking.location
  resource_group_name = azurerm_resource_group.rghubnetworking.name
}



resource "azurerm_network_security_rule" "rule-1-gw" {
  name                        = "rule1"
  priority                    = 100
  direction                   = "Outbound"
  access                      = "Allow"
  protocol                    = "*"
  source_port_range           = "*"
  destination_port_range      = "*"
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  description                 = "Allow all for test"
  resource_group_name         = azurerm_resource_group.rghubnetworking.name
  network_security_group_name = azurerm_network_security_group.gw-subnet-nsg.name
}


resource "azurerm_network_security_rule" "rule-1-fw" {
  name                        = "rule1"
  priority                    = 100
  direction                   = "Outbound"
  access                      = "Allow"
  protocol                    = "*"
  source_port_range           = "*"
  destination_port_range      = "*"
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  description                 = "Allow all for test"
  resource_group_name         = azurerm_resource_group.rghubnetworking.name
  network_security_group_name = azurerm_network_security_group.fw-subnet-nsg.name
}