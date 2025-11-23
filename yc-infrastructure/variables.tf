variable "yc_cloud_id" {
  type        = string
}

variable "yc_folder_id" {
  type        = string
}

variable "yc_zone" {
  type        = string
  default     = "ru-central1-a"
}

variable "vm_image_family" {
  type        = string
  default     = "ubuntu-2204-lts"
}

variable "vm_cores" {
  type        = number
  default     = 2
}

variable "vm_memory" {
  type        = number
  default     = 4
}

variable "ssh_key_path" {
  type        = string
  default     = "~/.ssh/id_rsa.pub"
}

variable "ansible_user" {
  type        = string
  default     = "ubuntu"
}

variable "service_account_key_file" {
  type        = string
  default     = null
}