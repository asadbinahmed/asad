resource "azurerm_resource_group" "recipe" {

  location = "northcentralus"
  name     = "recipe-dev-rg"

}

resource "azurerm_service_plan" "service_plan" {

  resource_group_name = azurerm_resource_group.recipe.name  
  location            = "northcentralus"
  name                = "recipe-dev-asp"
  os_type             = "Linux"
  sku_name            = "B1"

}