resource "azurerm_public_ip" "fwpubip" {
  name                = "testpip"
  location            = azurerm_resource_group.rghubnetworking.location
  resource_group_name = azurerm_resource_group.rghubnetworking.name
  allocation_method   = "Static"
  sku                 = "Standard"
}

resource "azurerm_firewall" "fw" {
  name                = "testfirewall"
  location            = azurerm_resource_group.rghubnetworking.location
  resource_group_name = azurerm_resource_group.rghubnetworking.name
  sku_name            = "AZFW_VNet"
  sku_tier            = "Standard"

  ip_configuration {
    name                 = "configuration"
    subnet_id            = azurerm_subnet.firewallsubnet.id
    public_ip_address_id = azurerm_public_ip.fwpubip.id
  }
}


resource "azurerm_firewall_policy" "fwpolicy" {
  name                = "example-policy"
  resource_group_name = azurerm_resource_group.rghubnetworking.name
  location            = azurerm_resource_group.rghubnetworking.location
}