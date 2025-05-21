variable "token" {}

variable "secret" {
  default = {
    Roboshop-dev = {
      description = "RobeShop App Component All secrets"
    }
    Roboshop-infra = {
      description = "Roboshop Infra related secrets"
    }
  }
}