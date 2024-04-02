resource "azurerm_virtual_network" "vnet" {

  resource_group_name = azurerm_resource_group.recipe.name  
  location            = var.environment.location 
  name                = "${local.base_name}-vnet"
  address_space       = [ var.environment.vnet_address_space ] 

}

resource "azurerm_subnet" "resources" {

  name                 = "resources"
  resource_group_name  = azurerm_resource_group.recipe.name  
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = [ cidrsubnet(var.environment.vnet_address_space,6,1) ] 

}

resource "azurerm_subnet" "app" {

  name                 = "app"
  resource_group_name  = azurerm_resource_group.recipe.name  
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = [ cidrsubnet(var.environment.vnet_address_space,6,2) ] 

  delegation {
    name = "app"

    service_delegation {
      name    = "Microsoft.Web/serverFarms"
      actions = ["Microsoft.Network/virtualNetworks/subnets/action"]
    }
  }

}