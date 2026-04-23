terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = var.aws_region
}

# --- SSH Key Pair ---
resource "aws_lightsail_key_pair" "portal_key" {
  name       = "vietstar_portal_key"
  public_key = var.ssh_public_key
}

# --- Lightsail Instance ---
resource "aws_lightsail_instance" "portal_instance" {
  name              = "Vietstar_Portal_Demo"
  availability_zone = "${var.aws_region}a"
  blueprint_id      = "ubuntu_22_04"
  # small_3_0 = $10/mo (Free Tier Eligible), 2 GB RAM, 2 vCPUs
  bundle_id         = "small_3_0"

  key_pair_name   = aws_lightsail_key_pair.portal_key.name
  ip_address_type = "dualstack"

  # Build the project deployment package locally before pushing
  provisioner "local-exec" {
    command = "zip -r app.zip ../business_portal ../database -x '*/vendor/*' '*/node_modules/*' '*/.git/*'"
  }

  connection {
    type        = "ssh"
    user        = "ubuntu"
    private_key = file(var.ssh_private_key_path)
    host        = self.public_ip_address
  }

  # Server Bootstrap Script & Push via SSH
  provisioner "remote-exec" {
    inline = [
      "sudo mkdir -p /home/ubuntu/app",
      "sudo chown -R ubuntu:ubuntu /home/ubuntu/app"
    ]
  }

  provisioner "file" {
    source      = "app.zip"
    destination = "/home/ubuntu/app/app.zip"
  }

  provisioner "remote-exec" {
    inline = [
      "sudo apt-get update",
      "sudo apt-get install -y unzip apt-transport-https ca-certificates curl software-properties-common",
      "curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --yes --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg",
      "echo \"deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable\" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null",
      "sudo apt-get update",
      "sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-compose-plugin",
      "sudo usermod -aG docker ubuntu",
      "cd /home/ubuntu/app",
      "unzip -o app.zip",
      "rm app.zip",
      "cd /home/ubuntu/app/business_portal",
      # Run Docker deployment
      "sudo docker compose build --no-cache",
      "sudo docker compose up -d",
      "echo '0 0 * * 0 root cd /home/ubuntu/app/business_portal && /usr/bin/docker compose down -v && /usr/bin/docker compose up -d' | sudo tee /etc/cron.d/db_reset",
      "sudo chmod 0644 /etc/cron.d/db_reset"
    ]
  }
}

# --- Network Port Mappings ---
resource "aws_lightsail_instance_public_ports" "portal_ports" {
  instance_name = aws_lightsail_instance.portal_instance.name

  port_info {
    protocol  = "tcp"
    from_port = 22
    to_port   = 22
  }

  port_info {
    protocol  = "tcp"
    from_port = 80
    to_port   = 80
  }

  port_info {
    protocol  = "tcp"
    from_port = 8081
    to_port   = 8081
  }

  port_info {
    protocol  = "tcp"
    from_port = 443
    to_port   = 443
  }
}

# --- Fetch the existing hosted zone for the parent domain ---
data "aws_route53_zone" "main" {
  name         = var.parent_domain
  private_zone = false
}

# --- Create and manage the subdomain ---
resource "aws_route53_record" "app_subdomain" {
  zone_id = data.aws_route53_zone.main.zone_id
  name    = var.custom_domain
  type    = "A"
  ttl     = 300
  records = [aws_lightsail_instance.portal_instance.public_ip_address]
}

# --- DNS & Custom Domain (Route 53) ---
# Automatically find the Route 53 Hosted Zone if a domain variable is provided
# data "aws_route53_zone" "selected" {
#   count = var.custom_domain != "" ? 1 : 0
#   name  = "${var.custom_domain}."
# }

# Create an 'A Record' linking the Domain to the Lightsail IP
# resource "aws_route53_record" "portal_dns" {
#  count   = var.custom_domain != "" ? 1 : 0
#  zone_id = data.aws_route53_zone.selected[0].zone_id
#  name    = var.custom_domain
#  type    = "A"
#  ttl     = 300
#  records = [aws_lightsail_instance.portal_instance.public_ip_address]
#}
