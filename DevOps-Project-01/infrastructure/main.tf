# Main Terraform configuration for AWS infrastructure

terraform {
  required_version = ">= 1.0.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
  
  backend "s3" {
    bucket = "tf-state-devops-projects"
    key    = "DevOps-Project-01/terraform.tfstate"
    region = "us-east-1"
  }
}

provider "aws" {
  region = var.aws_region
}

# Bastion VPC - only public subnets and IGW (no NAT)
module "bastion_vpc" {
  source = "./modules/vpc"

  environment     = "${var.environment}-bastion"
  vpc_cidr        = var.bastion_vpc_cidr
  public_subnets  = var.bastion_public_subnets
  private_subnets = []
  azs             = var.availability_zones
  create_nat      = false
}

# Application VPC - public + private subnets, NAT gateways
module "app_vpc" {
  source = "./modules/vpc"

  environment     = "${var.environment}-app"
  vpc_cidr        = var.app_vpc_cidr
  public_subnets  = var.app_public_subnets
  private_subnets = var.app_private_subnets
  azs             = var.availability_zones
  create_nat      = true
}

# Security Module (example) referencing the application VPC
module "security" {
  source = "./modules/security"

  environment = var.environment
  vpc_id      = module.app_vpc.vpc_id
}