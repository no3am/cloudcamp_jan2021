resource "azurerm_lb" "lb" {
  resource_group_name = var.rg_name
  location            = var.location
  name                = var.lb_name
  sku                 = "Standard"

  frontend_ip_configuration {
    name                 = var.pip_name
    public_ip_address_id = var.pip_id
  }
}

resource "azurerm_lb_nat_rule" "lb_nat_rule" {
  backend_port                   = 80
  frontend_ip_configuration_name = var.pip_name
  frontend_port                  = 80
  loadbalancer_id                = azurerm_lb.lb.id
  name                           = "inbound"
  protocol                       = "Tcp"
  resource_group_name            = var.rg_name
}

resource "azurerm_lb_probe" "lb_prob" {
  name                = var.probe_name
  resource_group_name = var.rg_name
  loadbalancer_id     = azurerm_lb.lb.id
  port                = var.probe_port
  protocol            = "http"
  request_path        = "/index.html"
}

//resource "azurerm_network_interface_nat_rule_association" "lb_nat_association" {
//  ip_configuration_name = var.ip_config_name
//  nat_rule_id           = azurerm_lb_nat_rule.lb_nat_rule.id
//  network_interface_id = var.nic_id
//}