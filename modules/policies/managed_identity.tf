


resource "azurerm_user_assigned_identity" "enforcementid" {
  location            = "northeurope"
  name                = "mi-policy-enforcement"
  resource_group_name = "RG_BP_HUB_Vnet_Dev"
}