Usage:

```hcl
data "local_file" "ssh_public_key" {
    filename = "/home/david/.ssh/id_rsa.pub"
}

module "proxmox_vm" {
  source "modules/proxmox_vm"

  test1 = {
     description = "instance deployed via Terraform"
     domain      = "some.fqdn.com
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
```

## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| proxmox | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| proxmox\_vms | VMs definitions | `map(any)` | n/a | yes |
| vm\_defaults | VM defaults | <pre>object({<br>    agent     = bool<br>    bios      = string<br>    boot      = string<br>    cores     = string<br>    cpu       = string<br>    disk_size = string<br>    memory    = string<br>    sockets   = string<br>    storage   = string<br>  })</pre> | <pre>{<br>  "agent": false,<br>  "bios": "seabios",<br>  "boot": "cdn",<br>  "cores": "1",<br>  "cpu": "host",<br>  "disk_size": "8",<br>  "memory": "512",<br>  "sockets": "1",<br>  "storage": "local-lvm"<br>}</pre> | no |

## Outputs

No output.

