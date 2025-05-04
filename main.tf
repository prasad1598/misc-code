module "tools" {
  for_each = {
    for k, v in var.tools : k => v if contains(var.deploy, k)
  }
  source   = "./toolsetup/vm"
  name     = each.key
  rg_name  = var.rg_name
  location = var.location
  vm_size = each.value["vm_size"]
}