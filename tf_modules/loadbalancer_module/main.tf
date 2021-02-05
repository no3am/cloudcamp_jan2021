resource "azurerm_lb" "lb" {
  resource_group_name = var.rg_name
  location            = var.location
  name                = var.lb_name
  sku                 = "Basic"

  frontend_ip_configuration {
    name                 = var.pip_name
    public_ip_address_id = var.pip_id
  }
}

resource "azurerm_lb_backend_address_pool" "lb_backend" {
  name                = var.backend_name
  resource_group_name = var.rg_name
  loadbalancer_id     = azurerm_lb.lb.id
//  backend_address {
//    name               = "internal_backend"
//    virtual_network_id = var.vnet_id
//    ip_address         = var.nic_ip
//  }
}

//resource "azurerm_lb_nat_rule" "lb_nat_rule" {
//  backend_port                   = 80
//  frontend_ip_configuration_name = azurerm_lb.lb.frontend_ip_configuration
//  frontend_port                  = 80
//  loadbalancer_id                = azurerm_lb.lb.id
//  name                           = "stam"
//  protocol                       = "http"
//  resource_group_name            = var.rg_name
//}

resource "azurerm_lb_probe" "lb_prob" {
  name                = var.probe_name
  resource_group_name = var.rg_name
  loadbalancer_id     = azurerm_lb.lb.id
  port                = var.probe_port
  protocol            = "http"
  request_path        = "/index.html"
}