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

  app_settings = merge(
    {
      environment = var.environment.type == "dev" ? "Development" : "Production"
      proteins    = var.ingredients.proteins
    },
    local.keyvault_secret_references
  )
  
  site_config {
    application_stack {
      python_version = "3.11"
    }
    health_check_path                 = "/health"
    health_check_eviction_time_in_min = 2
  }

  identity {
    type = "SystemAssigned"
  }

}

resource "azurerm_app_service_source_control" "app" {

  app_id                 = azurerm_linux_web_app.app.id
  repo_url               = "https://github.com/eltimmo/azure_web_app.git"
  branch                 = "main"
  use_manual_integration = true
  use_mercurial          = false

  count = var.environment.deploy == true ? 1 : 0

}