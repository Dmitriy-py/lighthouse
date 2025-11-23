variable "vm_image_id" {
  type        = string
}

variable "subnet_id" {
  type        = string
}

variable "ssh_user" {
  type        = string
}

variable "ssh_key_path" {
  type        = string
}

variable "vm_cores" {
  type        = number
}

variable "vm_memory" {
  type        = number
}

variable "instances" {
  type = map(object({
    name      = string
    disk_size = number
  }))
}