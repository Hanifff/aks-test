resource "azurerm_route_table" "rt" {
  name                = var.rt_name
  location            = var.location
  resource_group_name = var.resource_group

  route {
    name                   = "kubenetfw_fw_r"
    address_prefix         = "10.0.5.0/24"
    next_hop_type          = "VnetLocal"//"VirtualAppliance"
    // next_hop_in_ip_address = var.firewal_private_ip
  }
}

resource "azurerm_subnet_route_table_association" "aks_subnet_association" {
  subnet_id      = var.subnet_id
  route_table_id = azurerm_route_table.rt.id
}