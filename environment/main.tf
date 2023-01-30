terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
      version = "0.84.0"
    }
  }

  backend "s3" {
  endpoint   = "storage.yandexcloud.net"
  bucket     = "terraform-yandex"
  region     = "ru-central1"
  key        = "terraform.tfstate"
  access_key = ""
  secret_key = ""

  skip_region_validation      = true
  skip_credentials_validation = true
}
}

module "infrastructure" {
  
  source = "../config/infrastructure"
}