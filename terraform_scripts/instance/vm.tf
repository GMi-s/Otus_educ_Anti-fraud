# Deploy several copies

resource "yandex_compute_instance" "vm" {
  for_each = var.instances
    name        = each.key
    platform_id = "standard-v1"
    zone     = "ru-central1-b"
    folder_id = var.folder_id
  
  resources {
    cores  = 2
    memory = 2
  }

  boot_disk {
    initialize_params {
      image_id = each.value.ami
    }
  }

  network_interface {
    subnet_id      = "enpl7d1bjg9v01ljm7s1"
    nat            = true
  }

  metadata = {
    ssh-keys  = "root:${file("~/.ssh/id_ed25519.pub")}"
  }
}