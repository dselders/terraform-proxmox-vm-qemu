variable "proxmox_tls_insecure" {
  description = "Allow use of insecure TLS connections"
  type        = bool
  default     = true
}

variable "proxmox_api_url" {
  description = "Proxmox API URL"
  type        = string
}

variable "proxmox_user" {
  description = "User used to connect to the Proxmox API with"
  type        = string
}

variable "proxmox_password" {
  description = "Proxmox API users password"
  type        = string
}
