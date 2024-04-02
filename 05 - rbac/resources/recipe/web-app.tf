resource "azurerm_service_plan" "plan" {

  resource_group_name = azurerm_resource_group.recipe.name  
  location            = var.environment.location
  name                = "${local.base_name}-asp"
  os_type             = "Linux"
  sku_name            = "B1"

}

resource "azurerm_linux_web_app" "app" {

  name                      = "${local.base_name}-app"
  resource_group_name       = azurerm_resource_group.recipe.name  
  location                  = var.environment.location   
  service_plan_id           = azurerm_service_plan.plan.id
  https_only                = true

  app_settings = {
    environment = var.environment.type == "dev" ? "Development" : "Production"
    proteins    = var.ingredients.proteins 
  }
  
  site_config {
    application_stack {
      python_version = "3.11"
    }
  }

  identity {
    type = "SystemAssigned"
  }

}