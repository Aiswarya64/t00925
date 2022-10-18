terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "3.25.0"
    }
  }
}

provider "azurerm" {
  subscription_id = "fdc64f4e-4f9c-47d8-ae27-6f31c6c15d2b"
  tenant_id = "892504b9-8f0a-4412-ba81-facc01ded79f"
  client_id = "29b6fe63-1d62-41d2-a014-d0051b53aa2d"
  client_secret = "Rbw8Q~NPUAW1Ts4WeLSvvOPG7qpxIIrKDVHPkdvC"
  features{}
}

resource "azurerm_resource_group" "app-grp" {
  name     = "app-grp"
  location = "North Europe"
}

resource "azurerm_storage_account" "logic_app_storage"{
  name= "storreeaccc980765"
  resource_group_name = azurerm_resource_group.app-grp.name
  location = azurerm_resource_group.app-grp.location
  account_tier = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_app_service_plan" "app_serve_name" {
  name = "azureapp_serveplan_47580"
  location = azurerm_resource_group.app-grp.location
  resource_group_name = azurerm_resource_group.app-grp.name
  kind = "elastic"
  
  sku {
    tier ="WorkflowStandard"
    size="WS1"
  }
}

resource "azurerm_logic_app_standard" "logic_app_standard" {
  name = "testazurelogicazzz"
  location = azurerm_resource_group.app-grp.location
  resource_group_name = azurerm_resource_group.app-grp.name
  app_service_plan_id = azurerm_app_service_plan.app_serve_name.id
  storage_account_name = azurerm_storage_account.logic_app_storage.name
  storage_account_access_key = azurerm_storage_account.logic_app_storage.primary_access_key
  
}




