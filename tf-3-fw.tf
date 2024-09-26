resource "azurerm_public_ip" "fwpubip" {
    name                = "fwpip"
    location            = azurerm_resource_group.rghubnetworking.location
    resource_group_name = azurerm_resource_group.rghubnetworking.name
    allocation_method   = "Static"
    sku                 = "Standard"
    zones               = ["1", "2", "3"]
    tags = var.tags
}

resource "azurerm_firewall" "fw" {
    name                = "testfirewall"
    location            = azurerm_resource_group.rghubnetworking.location
    resource_group_name = azurerm_resource_group.rghubnetworking.name
    sku_name            = "AZFW_VNet"
    sku_tier            = "Premium"
    zones               = ["1", "2", "3"]
    ip_configuration {
    name                 = "configuration"
    subnet_id            = azurerm_subnet.firewallsubnet.id
    public_ip_address_id = azurerm_public_ip.fwpubip.id
    }
    firewall_policy_id = azurerm_firewall_policy.fwpolicy.id
    tags = var.tags
}

resource "azurerm_firewall_policy" "fwpolicy" {
    name                = "fwpolicy"
    resource_group_name = azurerm_resource_group.rghubnetworking.name
    location            = azurerm_resource_group.rghubnetworking.location
    sku                 = "Premium"
    intrusion_detection {
        mode = "Deny"
    }
}