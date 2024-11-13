resource "aws_eks_cluster" "this" {
  name     = "${var.environment}-eks-cluster"
  role_arn = aws_iam_role.eks_role.arn

  vpc_config {
    subnet_ids = var.public_subnet_ids
    endpoint_public_access = true
    endpoint_private_access = false
  }

  tags = {
    Name        = "${var.environment}-eks-cluster"
    Environment = var.environment
  }
}


resource "aws_iam_role" "eks_role" {
  name = "${var.environment}-eks-role"

  assume_role_policy = data.aws_iam_policy_document.eks_assume_role_policy.json
}

# Data and IAM policies can be defined for the role
data "aws_iam_policy_document" "eks_assume_role_policy" {
  statement {
    actions = ["sts:AssumeRole"]

    principals {
      type        = "Service"
      identifiers = ["eks.amazonaws.com"]
    }
  }
}
