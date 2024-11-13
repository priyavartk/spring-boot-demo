variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
}

variable "az_count" {
  description = "Number of availability zones to create subnets in"
  type        = number
  default     = 3
}

variable "environment" {
  description = "Environment name (e.g. dev, prod)"
  type        = string
  default     = "prod"
}

variable "enable_nat_gateway" {
  description = "Enable NAT Gateway for outbound internet access for private subnets"
  type        = bool
  default     = true
}

variable "region" {
  description = "AWS region for the VPC"
  type        = string
}

