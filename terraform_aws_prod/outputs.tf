output "vpc_id" {
  value = aws_vpc.main.id
}

output "alb_dns_name" {
  value = aws_lb.main.dns_name
}

output "app_url" {
  value = "https://${var.custom_domain}"
}

output "rds_endpoint" {
  value = aws_db_instance.main.endpoint
}

output "asg_name" {
  value = aws_autoscaling_group.app.name
}
