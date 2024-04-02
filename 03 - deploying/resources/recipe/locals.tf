locals {

  base_name = "recipe-${var.environment.type}"

  keyvault_secret_references = { for key, value in var.ingredients.sauces: key => "@Microsoft.KeyVault(VaultName=${azurerm_key_vault.vault.name};SecretName=${key})" }

  ip_restrictions = [
    { ip_address  = "${chomp(data.http.icanhazip.response_body)}/32" },
    { service_tag = "AzureFrontDoor.Backend" }
  ]

}