locals {
  stack = "${var.app}-${var.env}-${var.region}"

  default_tags = {
    app         = var.app
    environment = var.env
    owner       = "AndrejVysny"
    paid        = true
  }
}

data "azurerm_subscription" "current" {}


resource "azurerm_resource_group" "rg-application" {
  name     = "rg-${local.stack}"
  location = var.region
  tags     = local.default_tags
}

resource "azurerm_container_app_environment" "acaenv" {
  name                       = "acaenv-${local.stack}"
  location                   = azurerm_resource_group.rg-application.location
  resource_group_name        = azurerm_resource_group.rg-application.name
  log_analytics_workspace_id = null#azurerm_log_analytics_workspace.acalogs.id
  tags                       = local.default_tags
}
/*
resource "azurerm_log_analytics_workspace" "acalogs" {
  name                = "alaw-${local.stack}"
  location            = azurerm_resource_group.rg-application.location
  resource_group_name = azurerm_resource_group.rg-application.name
  sku                 = "PerGB2018"
  retention_in_days   = 30
}*/