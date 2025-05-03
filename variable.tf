variable "tools" {
  default = {
    vault = {
      vm_size = "Standerd_B1s"
    }
  }
}

# vault is a key & name is also a vault

variable "rg_name" {
  default = "project-setup-1"
}
variable "location" {
  default = "UK West"
}