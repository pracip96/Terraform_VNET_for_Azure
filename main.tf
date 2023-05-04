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
  subscription_id = "cafa5f5c-f197-4058-897b-3e26f8ae3fa7"
  client_id = "dedc9c87-4e2f-4c2e-a337-a2f1a7390643"
  client_secret = "zaE8Q~2rzrMHEixn9YG9TIHlmC4Izc8RCi9GMcvm"
  tenant_id = "a1ebca50-b870-423e-971e-98dbdbe96f11"
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
