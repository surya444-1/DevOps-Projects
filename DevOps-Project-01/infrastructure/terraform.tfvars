aws_region = "us-east-1"

# Environment
environment = "dev"

# Bastion VPC
bastion_vpc_cidr = "192.168.0.0/16"
bastion_public_subnets = ["192.168.10.0/24", "192.168.11.0/24"]

# App VPC
app_vpc_cidr = "172.32.0.0/16"
app_public_subnets = ["172.32.1.0/24", "172.32.2.0/24"]
app_private_subnets = [
  "172.32.10.0/24", "172.32.11.0/24",
  "172.32.20.0/24", "172.32.21.0/24",
  "172.32.30.0/24", "172.32.31.0/24"
]

availability_zones = ["us-east-1a", "us-east-1b"]

# EC2 and DB defaults
instance_type = "t3.micro"
key_name = "your-ssh-key-name"
# Autoscaling defaults (currently unused)
