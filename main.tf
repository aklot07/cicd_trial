provider "azurerm" {
  features {}
  client_id       = "a3c62e6b-0955-456d-a3ba-a390c03ff727"
  client_secret   = "KHd8Q~KT.kk2GNqlD-gbJgXp3vQTZUQIzMIGdag1"
  tenant_id       = "28c01656-58dc-4e93-a586-3233d63ffafe"
  subscription_id = "94e82c16-35e8-4375-99f7-01c788dd9c3c"
}

resource "azurerm_resource_group" "akrsg" {
  name     = "AK-k8s"
  location = "East Asia"
}

resource "azurerm_kubernetes_cluster" "ak_k8s" {
  name                = "ak-k8s"
  location            = "East Asia"
  resource_group_name = azurerm_resource_group.akrsg.name
  dns_prefix          = "akdnsprefix"
  kubernetes_version  = "1.25.6"

  default_node_pool {
    name       = "agentpool"
    node_count = 2
    vm_size    = "Standard_B2s"
    zones      = ["1"]
  }
  identity {
    type = "SystemAssigned"
  }
}
