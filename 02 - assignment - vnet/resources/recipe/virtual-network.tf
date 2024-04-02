resource "azurerm_virtual_network" "vnet" {

  resource_group_name = azurerm_resource_group.recipe.name  
  location            = var.environment.location 
  name                = "${local.base_name}-vnet"
  address_space       = [ var.environment.vnet_address_space ] 

}