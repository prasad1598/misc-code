provider "azurerm" {
  features {}
  subscription_id = "aa32da49-0603-4855-b55b-bfd4bcf7b16f"
}

resource "azurerm_storage_account" "tfstate" {
  name                     = "terratfstateform"
  resource_group_name      = "project_rg"
  location                 = "UK West"
  account_tier             = "Standard"
  account_replication_type = "GRS"
}

resource "azurerm_storage_container" "tfstates" {
  name                  = "roboshop-tfstate-files"
  storage_account_id    = azurerm_storage_account.tfstate.id
  container_access_type = "private"
}