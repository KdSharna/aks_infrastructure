terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.57.0"
    }
  }
  backend "azurerm" {
    resource_group_name  = "pintu11"
    storage_account_name = "tattu100"
    container_name       = "con99"
    key                  = "aorocd.terraform_state"
  }
}
provider "azurerm" {
  features {}
  subscription_id = "cfc0d37c-0341-4d06-bcf3-35b93770a2ee"
}
