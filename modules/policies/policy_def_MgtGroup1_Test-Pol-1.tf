# Policy Management

data "azurerm_management_group" "mgt_group" {
  name = "SmallBudget"
}

resource "azurerm_policy_definition" "policy" {
    name         = "Test-Pol-1"
    policy_type  = "Custom"
    mode         = "Indexed"
    display_name = "acceptance test policy definition"
    management_group_id = data.azurerm_management_group.mgt_group.id

    metadata = <<METADATA
    {
    "category": "General"
    }

    METADATA


    policy_rule = <<POLICY_RULE
    {
    "if": {
        "not": {
        "field": "location",
        "in": "[parameters('allowedLocations')]"
        }
    },
    "then": {
        "effect": "audit"
    }
    }
    POLICY_RULE


    parameters = <<PARAMETERS
    {
    "allowedLocations": {
        "type": "Array",
        "metadata": {
        "description": "The list of allowed locations for resources.",
        "displayName": "Allowed locations",
        "strongType": "location"
        }
    }
    }
    PARAMETERS
}
