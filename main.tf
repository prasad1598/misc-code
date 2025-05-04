module "tools" {
  for_each = var.tools
  source   = "./toolsetup/vm"
  name     = each.key
  rg_name  = var.rg_name
  location = var.location
  vm_size = each.value["vm_size"]
}