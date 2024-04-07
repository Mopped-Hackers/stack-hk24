
output "RG_NAME" {
  value       = azurerm_resource_group.rg-application.name
  description = "Resource group name"
}


output "APP_NAME_FRONTEND" {
  value = azurerm_container_app.frontend.name
}

output "APP_NAME_BACKEND" {
  value = azurerm_container_app.backend.name
}


output "APP_URL_FRONTEND" {
value = "https://${azurerm_container_app.frontend.ingress[0].fqdn}"
}

output "APP_URL_BACKEND" {
value = "https://${azurerm_container_app.backend.ingress[0].fqdn}"
}



#################### SECRETS ####################
/*
output "SECRET_CLIENT_ID" {
  value = azurerm_user_assigned_identity.uai.client_id
sensitive = true
}

output "SECRET_TENANT_ID" {
  value = azurerm_user_assigned_identity.uai.tenant_id
sensitive = true
}

output "SECRET_SUBSCRIPTION_ID" {
  value = data.azurerm_subscription.current.subscription_id
sensitive = true
}
*/
#################### SECRETS ####################