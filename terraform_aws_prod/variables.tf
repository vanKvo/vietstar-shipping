variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "us-east-1"
}

variable "project_name" {
  description = "Project name for tagging"
  type        = string
  default     = "vietstar-shipping"
}

variable "vpc_cidr" {
  description = "CIDR block for VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "db_username" {
  description = "Database administrator username"
  type        = string
  sensitive   = true
}

variable "db_password" {
  description = "Database administrator password"
  type        = string
  sensitive   = true
}

variable "ssh_public_key" {
  description = "Public key for SSH access (if needed via bastion/SSM)"
  type        = string
}

variable "certificate_arn" {
  description = "ARN of the ACM certificate for the ALB"
  type        = string
}

variable "parent_domain" {
  description = "The parent domain name (e.g., vanmuses.com)"
  type        = string
}

variable "custom_domain" {
  description = "The full custom domain for the app (e.g., portal.vanmuses.com)"
  type        = string
}
