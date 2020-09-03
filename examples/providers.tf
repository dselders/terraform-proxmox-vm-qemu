provider "proxmox" {
  pm_api_url      = "${var.proxmox_api_url}/api2/json"
  pm_user         = var.proxmox_user
  pm_password     = var.proxmox_password
  pm_tls_insecure = var.proxmox_tls_insecure
  pm_timeout      = "600" # 10 minutes
}

provider "local" {
  version = "~> 1.4"
}
