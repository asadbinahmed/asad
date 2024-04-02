resource "azurerm_key_vault" "vault" {

  resource_group_name       = azurerm_resource_group.recipe.name  
  location                  = var.environment.location 
  name                      = "recipe${var.environment.type}kvl"
  tenant_id                 = data.azurerm_client_config.current.tenant_id
  sku_name                  = "standard"
  enable_rbac_authorization = true

}