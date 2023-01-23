output "lb_dns" {
  value = aws_alb.aplication_lb[*].dns_name
}