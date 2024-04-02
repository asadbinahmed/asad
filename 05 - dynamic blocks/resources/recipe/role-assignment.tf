resource "azurerm_role_assignment" "cu_kva" {

  scope                = azurerm_key_vault.vault.id
  role_definition_name = "Key Vault Administrator"
  principal_id         = data.azurerm_client_config.current.object_id

}

resource "azurerm_role_assignment" "app_kvsu" {

  scope                = azurerm_key_vault.vault.id
  role_definition_name = "Key Vault Secrets User"
  principal_id         = azurerm_linux_web_app.app.identity.0.principal_id
  
}