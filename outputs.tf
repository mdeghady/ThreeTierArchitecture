##################################################################################
# OUTPUTS
##################################################################################

#Dns url to access the instances through the load balancer
output "lb_dns_name" {
    description = "DNS name for load balancer"
    value = aws_lb.external_app_lb.dns_name
}

output "db_endpoint" {
  description = "The Database Endpoint"
  value = aws_db_instance.mysql_db.address
  
}