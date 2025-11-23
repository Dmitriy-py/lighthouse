output "clickhouse_public_ip" {
  value = module.vm.instance_ips["clickhouse_host"].public
}
output "clickhouse_private_ip" {
  value = module.vm.instance_ips["clickhouse_host"].private
}

output "vector_public_ip" {
  value = module.vm.instance_ips["vector_host"].public
}
output "vector_private_ip" {
  value = module.vm.instance_ips["vector_host"].private
}

output "lighthouse_public_ip" {
  value = module.vm.instance_ips["lighthouse_host"].public
}
output "lighthouse_private_ip" {
  value = module.vm.instance_ips["lighthouse_host"].private
}

output "ansible_user" {
  value = var.ansible_user
}