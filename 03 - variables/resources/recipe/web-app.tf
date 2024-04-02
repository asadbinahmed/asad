resource "azurerm_service_plan" "plan" {

  resource_group_name = azurerm_resource_group.recipe.name  
  location            = var.environment.location
  name                = "${local.base_name}-asp"
  os_type             = "Linux"
  sku_name            = "B1"

}