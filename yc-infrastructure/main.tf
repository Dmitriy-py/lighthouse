data "yandex_vpc_network" "existing_network" {
  name = "default" 
}

resource "yandex_vpc_subnet" "vpc_subnet" {
  name           = "ansible-subnet"
  zone           = var.yc_zone
  network_id     = data.yandex_vpc_network.existing_network.id
  v4_cidr_blocks = ["192.168.10.0/24"]
}

# 2. Get the required image ID
data "yandex_compute_image" "vm_image" {
  family = var.vm_image_family
}

# 3. VM definition helper module
module "vm" {
  source = "./modules/vm_base"
  
  # Общие параметры
  vm_image_id  = data.yandex_compute_image.vm_image.image_id
  subnet_id    = yandex_vpc_subnet.vpc_subnet.id
  ssh_user     = var.ansible_user
  ssh_key_path = var.ssh_key_path
  vm_cores     = var.vm_cores
  vm_memory    = var.vm_memory
  
  # Специфические хосты
  instances = {
    "clickhouse_host" = {
      name = "clickhouse-host",
      disk_size = 15
    },
    "vector_host" = {
      name = "vector-host",
      disk_size = 10
    },
    "lighthouse_host" = {
      name = "lighthouse-host",
      disk_size = 10
    }
  }
}