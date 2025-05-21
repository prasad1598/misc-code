variable "token" {}

variable "secrets" {
  default = {
    Roboshop-dev = {
      description = "RobeShop App Component All secrets"
    }
    Roboshop-infra = {
      description = "Roboshop Infra related secrets"
    }
  }
}