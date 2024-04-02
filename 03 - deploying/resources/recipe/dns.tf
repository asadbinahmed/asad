resource "azurerm_private_dns_zone" "vault" {

  resource_group_name = azurerm_resource_group.recipe.name  
  name                = "privatelink.vaultcore.azure.net"

}

resource "azurerm_private_dns_zone_virtual_network_link" "vault" {

  resource_group_name   = azurerm_resource_group.recipe.name   
  name                  = "vault"
  private_dns_zone_name = azurerm_private_dns_zone.vault.name
  virtual_network_id    = azurerm_virtual_network.vnet.id

}