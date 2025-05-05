resource "azurerm_public_ip" "public-ip" {
  name                = "${var.name}-pub"
  resource_group_name = var.rg_name
  location            = var.location
  sku                 = "Basic"
  allocation_method   = "Dynamic"
}

resource "azurerm_network_interface" "private-ip" {
  name                = "${var.name}-nic"
  location            = var.location
  resource_group_name = var.rg_name

  ip_configuration {
    name                          = var.name
    subnet_id                     = "/subscriptions/aa32da49-0603-4855-b55b-bfd4bcf7b16f/resourceGroups/project_rg/providers/Microsoft.Network/virtualNetworks/project_vn/subnets/default"
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.public-ip.id
  }
}

resource "azurerm_network_interface_security_group_association" "nsg" {
  network_interface_id      = azurerm_network_interface.private-ip.id
  network_security_group_id = "/subscriptions/aa32da49-0603-4855-b55b-bfd4bcf7b16f/resourceGroups/project_rg/providers/Microsoft.Network/networkSecurityGroups/project_nsg"
}

resource "azurerm_virtual_machine" "vm" {
  name                  = var.name
  location              = var.location
  resource_group_name   = var.rg_name
  network_interface_ids = [azurerm_network_interface.private-ip.id]
  vm_size               = var.vm_size

delete_os_disk_on_termination = true

delete_data_disks_on_termination = true

  storage_image_reference {
    id = "/subscriptions/aa32da49-0603-4855-b55b-bfd4bcf7b16f/resourceGroups/project_rg/providers/Microsoft.Compute/images/test-devops-practice"
  }
  storage_os_disk {
    name              = "myosdisk1"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }
  os_profile {
    computer_name  = var.name
    admin_username = "azuser"
    admin_password = "Devops@12345"
  }
  os_profile_linux_config {
    disable_password_authentication = false
  }
}

resource "null_resource" "vault" {
  depends_on = [
    azurerm_virtual_machine.vm
  ]

  connection {
    type     = "ssh"
    user     = "azuser"
    password = "Devops@12345"
    host     = azurerm_network_interface.private-ip.private_ip_address
  }

  provisioner "remote-exec" {
    inline = [
      "sudo dnf install python3.12 python3.12-pip -y",
      "sudo pip3.12 install ansible",
      "ansible-pull -i localhost -U https://github.com/prasad1598/misc-code/tree/main/toolsetup tool_setup.yml -e tool_name=$(tool_name)"
    ]
  }
}

resource "azurerm_dns_a_record" "private_dns_record" {
  name                = "${var.name}-int"
  zone_name           = "prasaddevops.shop"
  resource_group_name = var.rg_name
  ttl                 = 3
  records             = [azurerm_public_ip.public-ip.ip_address]
}

resource "azurerm_dns_a_record" "public_dns_record" {
  name                = "${var.name}-dev"
  zone_name           = "prasaddevops.shop"
  resource_group_name = var.rg_name
  ttl                 = 3
  records             = [azurerm_network_interface.private-ip.private_ip_address]
}