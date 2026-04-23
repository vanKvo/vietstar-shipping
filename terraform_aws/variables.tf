variable "aws_region" {
  description = "The AWS Region to deploy Lightsail in (e.g., us-east-1)"
  type        = string
  default     = "us-east-1"
}

variable "ssh_public_key" {
  description = "The SSH public key string (ssh-rsa AAAA...) to add to the instance authorized_keys"
  type        = string
}

variable "ssh_private_key_path" {
  description = "The absolute path to the local SSH private key used by Terraform to securely push files"
  type        = string
}

variable "parent_domain" {
  description = "The parent domain name purchased in Route 53"
  type        = string
}

variable "custom_domain" {
  description = "The custom domain name pointing to the application"
  type        = string
}
