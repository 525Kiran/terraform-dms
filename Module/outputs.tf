#Endpoints
output "endpoints" {
  description = "A map of maps containing the endpoints created and their full output of attributes and values"
  value       = aws_dms_endpoint.kiran
  sensitive   = true
}

# Replication Tasks
output "replication_tasks" {
  description = "A map of maps containing the replication tasks created and their full output of attributes and values"
  value       = aws_dms_replication_task.kiran
}

#Subnet Group
output "replication_subnet_group_id" {
  description = "The ID of the subnet group"
  value       = element(concat(aws_dms_replication_subnet_group.kiran[*].id, [""]), 0)

}

# Instance
output "replication_instance_arn" {
  description = "The Amazon Resource Name (ARN) of the replication instance"
  value       = element(concat(aws_dms_replication_instance.kiran[*].replication_instance_arn, [""]), 0)
}

output "replication_instance_private_ips" {
  description = "A list of the private IP addresses of the replication instance"
  value       = element(concat(aws_dms_replication_instance.kiran[*].replication_instance_private_ips, [""]), 0)
}

output "replication_instance_public_ips" {
  description = "A list of the public IP addresses of the replication instance"
  value       = element(concat(aws_dms_replication_instance.kiran[*].replication_instance_public_ips, [""]), 0)
}