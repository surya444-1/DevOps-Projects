variable "aws_region" {
  description = "AWS region to deploy resources"
  type        = string
  default     = "us-east-1"
}

variable "environment" {
  description = "Environment name (e.g., dev, prod)"
  type        = string
  default     = "dev"
}

variable "vpc_cidr" {
  description = "CIDR block for VPC"
  type        = string
  default     = "192.168.0.0/16"
}

variable "bastion_vpc_cidr" {
  description = "CIDR block for bastion VPC"
  type        = string
  default     = "192.168.0.0/16"
}

variable "app_vpc_cidr" {
  description = "CIDR block for application VPC"
  type        = string
  default     = "172.32.0.0/16"
}

variable "public_subnets" {
  description = "CIDR blocks for public subnets"
  type        = list(string)
  default     = ["192.168.1.0/24", "192.168.2.0/24"]
}

variable "private_subnets" {
  description = "CIDR blocks for private subnets"
  type        = list(string)
  default     = ["192.168.3.0/24", "192.168.4.0/24"]
}

# Bastion VPC specific subnets (2 public)
variable "bastion_public_subnets" {
  description = "Public subnets for bastion VPC"
  type        = list(string)
  default     = ["192.168.10.0/24", "192.168.11.0/24"]
}

# App VPC: 2 public + 6 private across 2 AZs
variable "app_public_subnets" {
  description = "Public subnets for application VPC"
  type        = list(string)
  default     = ["172.32.1.0/24", "172.32.2.0/24"]
}

variable "app_private_subnets" {
  description = "Private subnets for application VPC (6 subnets: 2 app, 2 web, 2 db)"
  type        = list(string)
  default     = [
    "172.32.10.0/24", "172.32.11.0/24", # app
    "172.32.20.0/24", "172.32.21.0/24", # web
    "172.32.30.0/24", "172.32.31.0/24"  # db
  ]
}

variable "availability_zones" {
  description = "Availability zones"
  type        = list(string)
  default     = ["us-east-1a", "us-east-1b"]
}

variable "db_name" {
  description = "Name of the database"
  type        = string
  default     = "javaapp"
}

variable "db_username" {
  description = "Database master username"
  type        = string
  sensitive   = true
}

variable "db_password" {
  description = "Database master password"
  type        = string
  sensitive   = true
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t3.micro"
}

variable "key_name" {
  description = "Name of the SSH key pair"
  type        = string
}

variable "asg_min_size" {
  description = "Minimum size of the Auto Scaling Group"
  type        = number
  default     = 2
}

variable "asg_max_size" {
  description = "Maximum size of the Auto Scaling Group"
  type        = number
  default     = 6
}

variable "asg_desired_capacity" {
  description = "Desired capacity of the Auto Scaling Group"
  type        = number
  default     = 2
} 