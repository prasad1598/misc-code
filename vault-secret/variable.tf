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
        catalogue_url  = "http://catalogue-dev.prasaddevops.shop:8080/"
        user_url       = "http://user-dev.prasaddevops.shop:8080/"
        cart_url       = "http://cart-dev.prasaddevops.shop:8080/"
        shipping_url   = "http://shipping-dev.prasaddevops.shop:8080/"
        payment_url    = "http://payment-dev.prasaddevops.shop:8080/"
        CATALOGUE_HOST = "catalogue-dev.prasaddevops.shop"
        CATALOGUE_PORT = 8080
        USER_HOST      = "user-dev.prasaddevops.shop"
        USER_PORT      = 8080
        CART_HOST      = "cart-dev.prasaddevops.shop"
        CART_PORT      = 8080
        SHIPPING_HOST  = "shipping-dev.prasaddevops.shop"
        SHIPPING_PORT  = 8080
        PAYMENT_HOST   = "payment-dev.prasaddevops.shop"
        PAYMENT_PORT   = 8080
      }
    }

    catalogue = {
      secret = "roboshop-infra"
      value = {
        MONGO     = "true"
        MONGO_URL = "mongodb://mongodb-dev.prasaddevops.shop:27017/catalogue"
        DB_TYPE = "mongo"
        APP_GIT_URL = "https://github.com/roboshop-devops-project-v3/catalogue"
        DB_HOST: "mongodb-dev.prasaddevops.shop"
        SCHEMA_FILE = "db/master-data.js"
      }
    }

    cart = {
      secret = "roboshop-infra"
      value = {
        REDIS_HOST     = "redis-dev.prasaddevops.shop"
        CATALOGUE_HOST = "catalogue-dev.prasaddevops.shop"
        CATALOGUE_PORT = 8080
      }
    }

    user = {
      secret = "roboshop-infra"
      value = {
        MONGO     = "true"
        REDIS_URL = "redis://redis-dev.prasaddevops.shop:6379"
        MONGO_URL = "mongodb://mongodb-dev.prasaddevops.shop:27017/users"
      }
    }

    payment = {
      secret = "roboshop-infra"
      value = {
        CART_HOST = "cart-dev.prasaddevops.shop"
        CART_PORT = 8080
        USER_HOST = "user-dev.prasaddevops.shop"
        USER_PORT = 8080
        AMQP_HOST = "rabbitmq-dev.prasaddevops.shop"
        AMQP_USER = "roboshop"
        AMQP_PASS = "roboshop123"
      }
    }

    shipping = {
      secret = "roboshop-infra"
      value = {
        CART_ENDPOINT = "cart-dev.prasaddevops.shop:8080"
        DB_HOST       = "mysql-dev.prasaddevops.shop"
        user          = "root"
        password      = "RoboShop@1"
        DB_USER       = "root"
        DB_PASS       = "RoboShop@1"
        DB_TYPE       = "mysql"
        APP_GIT_URL   = "https://github.com/roboshop-devops-project-v3/shipping"
      }
    }

    rabbitmq = {
      secret = "roboshop-infra"
      value = {
        user = "roboshop"
        password = "roboshop123"
      }
    }

    mysql = {
      secret = "roboshop-infra"
      value = {
        password = "RoboShop@1"
      }
    }
  }
}
