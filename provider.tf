# Объявление провайдера
terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }
  required_version = ">= 0.13"
}

provider "yandex" {
  zone      = var.yc_zone
  folder_id = var.yc_folder_id
  cloud_id  = var.yc_cloud_id
  #token     = var.yc_token
  service_account_key_file = var.sa_key_file
}