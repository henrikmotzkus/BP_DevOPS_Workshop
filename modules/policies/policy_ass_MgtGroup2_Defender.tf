# Policy Management

resource "azurerm_resource_group_policy_assignment" "DefenderAss" {
  name                  = "Configure Microsoft Defender for Cloud plans"
  location              = "northeurope"
  resource_group_id     = var.resource_group_id
  policy_definition_id  = "/providers/Microsoft.Authorization/policySetDefinitions/f08c57cd-dbd6-49a4-a85e-9ae77ac959b0"
  identity {
    type                = "UserAssigned"   
    identity_ids        = [ azurerm_user_assigned_identity.enforcementid.id ]
  }
}