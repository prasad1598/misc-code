resource "azurerm_public_ip" "publicip" {
  name                = var.name
  resource_group_name = var.rg_name
  location            = var.location
  allocation_method   = "Dynamic"
}


resource "azurerm_network_interface" "privateip" {
  name                = "${var.name}-nic"
  location            = var.location
  resource_group_name = var.rg_name

  ip_configuration {
    name                          = var.name
    subnet_id                     = "/subscriptions/aa32da49-0603-4855-b55b-bfd4bcf7b16f/resourceGroups/project_rg/providers/Microsoft.Network/virtualNetworks/project_vn/subnets/default"
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_virtual_machine" "main" {
  name                  = "${var.name}-vm"
  location              = var.location
  resource_group_name   = var.rg_name
  network_interface_ids = [azurerm_network_interface.privateip.id]
  vm_size               = var.vm_size

delete_os_disk_on_termination = true

delete_data_disks_on_termination = true

  storage_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }
  storage_os_disk {
    name              = "myosdisk1"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }
  os_profile {
    computer_name  = "hostname"
    admin_username = "testadmin"
    admin_password = "Password1234!"
  }
  os_profile_linux_config {
    disable_password_authentication = false
  }
  tags = {
    environment = "staging"
  }
}