// environments/dev/main.tf
module "vpc" {
  source      = "../module/vpc"
  vpc_cidr    = "10.0.0.0/16"               // Define the CIDR for this environment
  az_count    = 3                           // Number of Availability Zones to use
  environment = "dev"                       // Set environment name
  region      = "eu-west-2"                 // Define AWS region
  enable_nat_gateway = true                 // Enable or disable NAT Gateway
}

module "eks" {
  source           = "../module/eks"
  environment      = "dev"
  public_subnet_ids = module.vpc.public_subnet_ids
  private_subnet_ids = module.vpc.private_subnet_ids
}

