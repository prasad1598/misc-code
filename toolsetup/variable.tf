variable "tools" {
  default = {
    vault = {
      vm_size = "Standard_B1s"
    }
  }
}

variable "rg_name" {
  default = "project_rg"
}
variable "location" {
  default = "UK West"
}