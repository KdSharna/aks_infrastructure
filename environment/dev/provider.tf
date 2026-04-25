terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.57.0"
    }
  }
  backend "azurerm" {
    resource_group_name  = "pintu11"
    storage_account_name = "tattu101"
    container_name       = "con99"
    key                  = "banana_terraform_state"
  }
}
provider "azurerm" {
  features {}
  subscription_id = "c062a425-c2d5-45ea-abe3-e00aca98b5cf"
}
