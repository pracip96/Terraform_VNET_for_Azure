terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "3.54.0"
    }
  }
}

provider "azurerm" {
  # Configuration options
  subscription_id = ""
  client_id = ""
  client_secret = ""
  tenant_id = ""
  features {}

  }
  
  locals {
    resource_group="prasanna_may04"
    location="East US"
  }
  resource "azurerm_resource_group" "prasanna_resourcegrp" {
    name = local.resource_group
    location = local.location
  }
 resource "azurerm_network_security_group" "nsggrp" {
  name                = "nsg_grp_terraform"
  location            = local.location
  resource_group_name = local.resource_group
}
  resource "azurerm_virtual_network" "vnet_prasanna" {
    name = "vnet_for_demo"
    location = local.location
    resource_group_name = local.resource_group
    address_space = ["10.0.0.0/16"]
    
    subnet{
      name = "subnet_prasanna"
      address_prefix = "10.0.1.0/24"
    }
    tags = {
      environment = "development"
    }
  }
