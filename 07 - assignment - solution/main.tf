resource "azurerm_resource_group" "recipe" {

  location = var.location
  name     = "${local.base_name}-rg"

  tags = {
    environment = "dev"
    applied     = timestamp()
  }

  lifecycle {
    ignore_changes = [
      tags["applied"]
    ]
  }

}

resource "azurerm_service_plan" "plan" {

  resource_group_name = azurerm_resource_group.recipe.name  
  location            = var.location
  name                = "${local.base_name}-asp"
  os_type             = "Linux"
  sku_name            = "B1"

}