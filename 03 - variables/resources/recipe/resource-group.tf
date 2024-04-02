resource "azurerm_resource_group" "recipe" {

  location = var.environment.location
  name     = "${local.base_name}-rg"

  tags = {
    environment = var.environment.type
    applied     = timestamp()
  } 

  lifecycle {
    ignore_changes = [
      tags["applied"]
    ]
  }
  
}