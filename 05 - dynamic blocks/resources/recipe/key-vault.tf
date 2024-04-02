resource "azurerm_key_vault" "vault" {

  resource_group_name       = azurerm_resource_group.recipe.name  
  location                  = var.environment.location 
  name                      = "recipe${var.environment.type}kvl"
  tenant_id                 = data.azurerm_client_config.current.tenant_id
  sku_name                  = "standard"
  enable_rbac_authorization = true

}

resource "azurerm_key_vault_secret" "sauces" {

  for_each = var.ingredients.sauces

    name         = each.key
    value        = each.value
    key_vault_id = azurerm_key_vault.vault.id

  depends_on = [
    azurerm_role_assignment.cu_kva
  ]

}