# Infrastructure README

## Overview
This Terraform-based infrastructure project sets up an AWS environment with the following components:

- **VPC Module**: Creates the Virtual Private Cloud (VPC) with public and private subnets, an Internet Gateway, and a NAT Gateway (optional).
- **EKS Module**: Deploys an Elastic Kubernetes Service (EKS) cluster into the created VPC.

The infrastructure is organized in a modular way to promote reusability and maintainability.

## Directory Structure

```sh
.
├── environment
│   ├── main.tf
│   ├── output.tf
│   ├── terraform.tfstate
│   └── terraform.tfstate.backup
└── module
    ├── eks
    │   ├── main.tf
    │   ├── output.tf
    │   └── vars.tf
    └── vpc
        ├── main.tf
        ├── output.tf
        ├── provider.tf
        └── vars.tf
```

### Description of Files and Folders

- **environment**: Contains environment-specific configurations, such as `main.tf` for deploying the VPC and EKS cluster.
  - `main.tf`: Defines the resources and calls the modules for provisioning.
  - `output.tf`: Outputs details of the created infrastructure components.
  - `terraform.tfstate` and `terraform.tfstate.backup`: State files that track the current infrastructure state.

- **module**: Contains reusable Terraform modules for creating different components.
  - **eks**: The module to create an EKS cluster.
    - `main.tf`: Defines the EKS cluster resource.
    - `output.tf`: Outputs details of the created EKS resources.
    - `vars.tf`: Defines input variables required by the EKS module.
  - **vpc**: The module to create a VPC.
    - `main.tf`: Defines the VPC, subnets, and networking resources.
    - `output.tf`: Outputs details of the created VPC resources.
    - `provider.tf`: Configures the AWS provider.
    - `vars.tf`: Defines input variables required by the VPC module.

## Usage

1. **Initialize Terraform**:
   ```sh
   terraform init
   ```

2. **Review the Execution Plan**:
   ```sh
   terraform plan
   ```

3. **Apply the Infrastructure**:
   ```sh
   terraform apply
   ```

4. **Destroy the Infrastructure** (if needed):
   ```sh
   terraform destroy
   ```

## Requirements
- Terraform >= 0.12
- AWS credentials with permissions to create VPC, EKS, and related resources.

## Modules

### VPC Module
The VPC module creates the following components:
- A VPC with a user-defined CIDR block.
- Public and private subnets across multiple Availability Zones.
- An Internet Gateway for public subnets.
- A NAT Gateway for private subnets (optional).

### EKS Module
The EKS module deploys an EKS cluster into the VPC created by the VPC module. It configures:
- An EKS cluster with public access enabled.
- Integration with the created VPC subnets.

## Outputs
The `output.tf` file in the `environment` directory provides the following outputs:
- **VPC ID**
- **Public Subnet IDs**
- **Private Subnet IDs**
- **Internet Gateway ID**
- **NAT Gateway ID** (if enabled)
- **Public Route Table ID**
- **Private Route Table IDs** (if enabled)

## Best Practices
- **State Management**: Use a remote backend (e.g., AWS S3) for storing the Terraform state in production environments.
- **IAM Roles and Policies**: Ensure appropriate IAM permissions are configured for secure and compliant resource creation.
- **Modularity**: Keep modules separate and reusable to promote clean and maintainable infrastructure code.

## Notes
- Always review the Terraform plan output before applying changes.
- This setup is intended for a **development** environment. Additional considerations are needed for production, such as high availability, monitoring, and security hardening.
