provider "azurerm" {
  features {}
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
