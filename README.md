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
| proxmox\_vms | VMs definitions | <pre>map(object({<br>    domain      = string<br>    description = string<br>    target_node = string<br>    clone       = string<br>    agent       = bool<br>    cores       = string<br>    memory      = string<br>    disk_size   = string<br>    storage     = string<br>    ip_address  = string<br>    gateway     = string<br>    ssh_key     = string<br>  }))</pre> | n/a | yes |

## Outputs

No output.

