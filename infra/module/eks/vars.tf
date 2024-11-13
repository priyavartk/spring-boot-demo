variable "environment" {
  description = "Environment name (e.g., dev, prod)"
  type        = string
}

variable "public_subnet_ids" {
  description = "List of public subnet IDs for the EKS cluster"
  type        = list(string)
}

variable "private_subnet_ids" {
  description = "List of private subnet IDs for the EKS cluster"
  type        = list(string)
}
