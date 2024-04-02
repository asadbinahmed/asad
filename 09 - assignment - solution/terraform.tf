terraform {

  required_version = "1.5.6"

  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = ">=3.0.0, <4.0.0"
    }
  }

}

provider "azurerm" {
  features {}
}