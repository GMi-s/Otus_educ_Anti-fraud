terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }
  required_version = ">= 0.13"
}

provider "yandex" {
  service_account_key_file = "otus-service-account-key.json"
}

#provider "yandex" {
# service_account_key_file = file("otus-service-account-key.json") # Убедитесь, что путь указан правильно
#  cloud_id           = "b1g7t93j6rlqshve3ivr" # Укажите ваш Cloud ID
#  folder_id          = "b1g04jak51qke7bj7pcc" # Укажите ваш Folder ID
#  zone               = "ru-central1-b"  # Укажите нужную зону
#}


# Создайте S3-бакет для хранения данных
#resource "yandex_storage_bucket" "data_bucket" {
#  name     = "my-data-bucket" # Уникальное имя вашего бакета
  #access_key = "your-access-key"  # Укажите ваш доступа (необязательно)
#}

# Создайте кластер для обработки данных
#resource "yandex_dataproc_cluster" "data_processing_cluster" {
#  name     = "data-processing-cluster"
#  folders = [var.folder_id]
#  zone = "ru-central1-a"
#  cluster_config {
#    resources {
#      core {
#        resource_preset_id = "s3.xsmall" # Укажите нужный тип машин
#        disk {
#          size = 100
#        }
#        count = 2 # Количество нод в кластере
#      }
#      service {
#        resource_preset_id = "s3.xsmall" # Укажите нужный тип машин для серверов
#        disk {
#          size = 100
#        }
#        count = 1 # Количество серверов в кластере
#      }
#    }
#  }
#}

# Для копирования данных из исходного S3 в созданный бакет
#resource "null_resource" "copy_data" {
#  provisioner "local-exec" {
#    command = <<EOT
#      aws s3 sync s3://otus-mlops-source-data/ s3://${yandex_storage_bucket.data_bucket.name}/
#    EOT
#    environment = {
#      AWS_ACCESS_KEY_ID     = "your-aws-access-key"  # Укажите ваш AWS Access Key
#      AWS_SECRET_ACCESS_KEY = "your-aws-secret-key"   # Укажите ваш AWS Secret Key
#    }
#  }
#}
