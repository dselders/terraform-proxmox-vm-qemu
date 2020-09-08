variable "proxmox_vms" {
  description = "VMs definitions"
  type        = map(any)
}

variable "vm_defaults" {
  description = "VM defaults"
  type = object({
    agent     = bool
    bios      = string
    boot      = string
    cores     = string
    cpu       = string
    disk_size = string
    memory    = string
    sockets   = string
    storage   = string
  })

  default = {
    agent     = false
    bios      = "seabios"
    boot      = "cdn"
    cores     = "1"
    cpu       = "host"
    disk_size = "8"
    memory    = "512"
    sockets   = "1"
    storage   = "local-lvm"
  }
}

locals {
  merged_vms = {
    for key, value in var.proxmox_vms :
    key => merge(var.vm_defaults, value)
  }
}
