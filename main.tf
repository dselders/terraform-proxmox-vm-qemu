/*
* Usage:
*
* ```hcl
* data "local_file" "ssh_public_key" {
*     filename = "/home/david/.ssh/id_rsa.pub"
* }
*
* module "proxmox_vm" {
*   source "modules/proxmox_vm"
*
*   test1 = {
*      description = "instance deployed via Terraform"
*      domain      = "some.fqdn.com
*      target_node = "pve"
*      agent       = true
*      clone       = "centos7"
*      cores       = "2"
*      memory      = "2048"
*      disk_size   = "16"
*      storage     = "local"
*      ip_address  = "192.168.1.10/24"
*      gateway     = "192.168.1.1"
*      ssh_key     = data.local_file.ssh_public_key.content
*
* }
* ```
*/
resource "proxmox_vm_qemu" "this" {
  for_each = var.proxmox_vms

  name = format("%s.%s", lower(each.key), lower(each.value["domain"]))
  desc = each.value["description"]

  target_node = each.value["target_node"]
  clone       = each.value["clone"]
  full_clone  = false
  os_type     = "cloud-init"
  agent       = each.value["agent"] ? 1 : 0

  sockets = "1"
  cpu     = "host"
  cores   = each.value["cores"]
  vcpus   = "0"

  memory = each.value["memory"]

  disk {
    id      = 0
    size    = each.value["disk_size"]
    type    = "virtio"
    storage = each.value["storage"]
  }

  network {
    id     = 0
    model  = "virtio"
    bridge = "vmbr0"
  }

  ipconfig0 = "ip=${each.value["ip_address"]},gw=${each.value["gateway"]}"
  sshkeys   = each.value["ssh_key"]

  # Hack to avoid changes on every plan/apply cycle
  lifecycle { ignore_changes = [bootdisk, network, scsihw] }
}
