terraform {

  required_version = "1.5.6"

  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = ">=3.0.0, <4.0.0"
    }
  }

  backend "azurerm" {
    resource_group_name  = "state"
    storage_account_name = "remstate"
    container_name       = "state"
    key                  = "terraform.tfstate"
  }

}

provider "azurerm" {
  features {}
}