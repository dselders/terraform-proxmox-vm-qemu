variable "proxmox_vms" {
  description = "VMs definitions"
  type = map(object({
    domain      = string
    description = string
    target_node = string
    clone       = string
    agent       = bool
    cores       = string
    memory      = string
    disk_size   = string
    storage     = string
    ip_address  = string
    gateway     = string
    ssh_key     = string
  }))
}
