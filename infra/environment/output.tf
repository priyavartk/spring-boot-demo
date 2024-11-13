

output "vpc_id" {
  description = "The ID of the VPC for the dev environment"
  value       = module.vpc.vpc_id
}

output "public_subnet_ids" {
  description = "The IDs of the public subnets for the dev environment"
  value       = module.vpc.public_subnet_ids
}

output "private_subnet_ids" {
  description = "The IDs of the private subnets for the dev environment"
  value       = module.vpc.private_subnet_ids
}

output "internet_gateway_id" {
  description = "The ID of the Internet Gateway for the dev environment"
  value       = module.vpc.internet_gateway_id
}

output "nat_gateway_id" {
  description = "The ID of the NAT Gateway for the dev environment (if enabled)"
  value       = module.vpc.nat_gateway_id
}

output "public_route_table_id" {
  description = "The ID of the public route table for the dev environment"
  value       = module.vpc.public_route_table_id
}

output "private_route_table_ids" {
  description = "The IDs of the private route tables for the dev environment (if NAT Gateway is enabled)"
  value       = module.vpc.private_route_table_ids
}
