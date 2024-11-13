output "vpc_id" {
  description = "The ID of the VPC"
  value       = aws_vpc.this.id
}

output "public_subnet_ids" {
  description = "The IDs of the public subnets"
  value       = aws_subnet.public.*.id
}

output "private_subnet_ids" {
  description = "The IDs of the private subnets"
  value       = aws_subnet.private.*.id
}

output "internet_gateway_id" {
  description = "The ID of the Internet Gateway"
  value       = aws_internet_gateway.this.id
}

output "nat_gateway_id" {
  description = "The ID of the NAT Gateway (if enabled)"
  value       = length(aws_nat_gateway.this) > 0 ? aws_nat_gateway.this[0].id : null
}

output "public_route_table_id" {
  description = "The ID of the public route table"
  value       = aws_route_table.public.id
}

output "private_route_table_ids" {
  description = "The IDs of the private route tables (if NAT Gateway is enabled)"
  value       = length(aws_route_table.private) > 0 ? aws_route_table.private.*.id : []
}
