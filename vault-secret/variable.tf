variable "token" {}

variable "secrets" {
  default = {
    roboshop-dev = {
      description = "RobeShop App Component All secrets"
    }
    roboshop-infra = {
      description = "Roboshop Infra related secrets"
    }
  }
}

variable "values" {
  default = {
    ssh = {
      secret = "Roboshop-infra"
      value = {
        username      = "azuser",
        password       = "Devops@12345"
      }
    }
  }
}
