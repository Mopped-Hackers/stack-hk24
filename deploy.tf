
/*
variable "github-user" {
  type        = string
  description = "github user"
  }


resource "azurerm_user_assigned_identity" "uai" {
  location            = azurerm_resource_group.rg-application.location
  name                = "ua-identity-${local.stack}"
  resource_group_name = azurerm_resource_group.rg-application.name
}

resource "azurerm_role_assignment" "example" {
  scope                = azurerm_resource_group.rg-application.id
  role_definition_name = "Contributor" # Change role if needed
  principal_id         = azurerm_user_assigned_identity.uai.principal_id
}


# Needed for each Repository

resource "azurerm_federated_identity_credential" "fic-<APP_NAME>" {
  name                = "uai-fic-${local.stack}-<APP_NAME>"
  resource_group_name = azurerm_resource_group.rg-application.name
  audience            = ["api://AzureADTokenExchange"]
  issuer              = "https://token.actions.githubusercontent.com"
  parent_id           = azurerm_user_assigned_identity.uai.id
  subject             = "repo:${var.github-user}/<REPO_NAME>:ref:refs/heads/<BRANCH>"
}

*/