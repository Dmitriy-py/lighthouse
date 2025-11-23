output "instance_ips" {
  value = {
    for key, instance in yandex_compute_instance.vm : key => {
      public = instance.network_interface[0].nat_ip_address
      private = instance.network_interface[0].ip_address
    }
  }
}