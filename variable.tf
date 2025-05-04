variable "deploy" {
  default = ["ansible"]
}

# variable "deploy" {
#   default = ["ansible"]
# }

variable "tools" {
  default = {
    vault = {
      vm_size = "Standard_B1s"
    }
    ansible-1 = {
      vm_size = "Standard_B2s"
    }
  }
}

# tools = {
#   vault = {}
#   workstation-1 = {}
# }

# vault is a key &
# vault should be a name

variable "rg_name" {
  default = "project_rg"
}
variable "location" {
  default = "UK West"
}