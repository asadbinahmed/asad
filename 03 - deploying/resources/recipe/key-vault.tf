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

resource "azurerm_private_endpoint" "vault" {

  name                = "${azurerm_key_vault.vault.name}-pep"
  resource_group_name = azurerm_resource_group.recipe.name  
  location            = var.environment.location   
  subnet_id           = azurerm_subnet.resources.id

  private_dns_zone_group {
    name                 = "default"
    private_dns_zone_ids = [ azurerm_private_dns_zone.vault.id ]
  }

  private_service_connection {
    name                           = "app"
    private_connection_resource_id = azurerm_key_vault.vault.id
    subresource_names              = [ "vault" ]
    is_manual_connection           = false
  }

}