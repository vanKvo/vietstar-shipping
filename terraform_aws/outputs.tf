output "portal_ipv4_address" {
  description = "The public IPv4 address assigned to your Lightsail instance"
  value       = aws_lightsail_instance.portal_instance.public_ip_address
}

output "portal_ipv6_address" {
  description = "The public IPv6 address assigned to your Lightsail instance"
  value       = aws_lightsail_instance.portal_instance.ipv6_addresses[0]
}

output "portal_url" {
  description = "The direct URL to access the deployed application demo"
  value       = "http://${aws_lightsail_instance.portal_instance.public_ip_address}:8081"
}

output "custom_domain_url" {
  description = "The custom domain URL to access the deployed application demo"
  value       = "https://${var.custom_domain}"
}
