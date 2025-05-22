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
      secret = "roboshop-infra"
      value = {
        username = "azuser",
        password = "Devops@12345"
      }
    }

    frontend = {
      secret = "roboshop-infra"
      value = {
        catalogue_url = "http://catalogue-dev.prasaddevops.shop:8080",
        user_url = "http://user-dev.prasaddevops.shop:8080",
        cart_url = "http://cart-dev.prasaddevops.shop:8080",
        shipping_url = "http://shipping-dev.prasaddevops.shop:8080",
        payment_url = "http://payment-dev.prasaddevops.shop:8080"
      }
    }

    catalauge = {
      secret = "roboshop-infra"
      value = {
        MONGO = true,
        MONGO_URL = "mongodb://mongodb-dev.prasaddevops.shop:27017/catalogue"
      }
    }

    cart = {
      secret = "roboshop-infra"
      value = {
        user = roboshop,
        REDIS_HOST = "redis-dev.prasaddevops.shop"
        CATALOGUE_HOST = "catalogue-dev.prasaddevops.shop"
        CATALOGUE_PORT = 8080
      }
    }

    user = {
      secret = "roboshop-infra"
      value = {
        MONGO = true,
        MONGO_URL = "mongodb://mongodb-dev.prasaddevops.shop:27017/catalogue"
      }
    }
  }
}
