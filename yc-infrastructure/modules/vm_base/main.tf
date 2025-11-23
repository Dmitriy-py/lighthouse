resource "yandex_compute_instance" "vm" {
  for_each = var.instances
  name        = each.value.name
  platform_id = "standard-v3"

  resources {
    cores  = var.vm_cores
    memory = var.vm_memory
  }

  boot_disk {
    initialize_params {
      image_id = var.vm_image_id
      size     = each.value.disk_size
      type     = "network-ssd"
    }
  }

  network_interface {
    subnet_id = var.subnet_id
    nat       = true
  }

  metadata = {
    ssh-keys = "${var.ssh_user}:${file(var.ssh_key_path)}"
  }
}