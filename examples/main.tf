module "virtual_machines" {
  source = "../modules/proxmox_vm"

  proxmox_vms = {
    test1 = {
      description = "example deployment via Terraform"
      domain      = "someplace.fun.net"
      target_node = "pve"
      agent       = true
      clone       = "centos7"
      cores       = "2"
      memory      = "2048"
      disk_size   = "16"
      storage     = "local"
      ip_address  = "192.168.1.10/24"
      gateway     = "192.168.1.1"
      ssh_key     = data.local_file.ssh_public_key.content
    }
  }
}
