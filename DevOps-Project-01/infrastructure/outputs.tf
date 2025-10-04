output "bastion_vpc_id" {
  description = "ID of the bastion VPC"
  value       = module.bastion_vpc.vpc_id
}

output "bastion_public_subnet_ids" {
  description = "Public subnet IDs for bastion VPC"
  value       = module.bastion_vpc.public_subnet_ids
}

output "app_vpc_id" {
  description = "ID of the application VPC"
  value       = module.app_vpc.vpc_id
}

output "app_public_subnet_ids" {
  description = "Public subnet IDs for application VPC"
  value       = module.app_vpc.public_subnet_ids
}

output "app_private_subnet_ids" {
  description = "Private subnet IDs for application VPC"
  value       = module.app_vpc.private_subnet_ids
}

output "app_internet_gateway_id" {
  description = "Internet Gateway ID for application VPC"
  value       = module.app_vpc.internet_gateway_id
}

output "app_nat_gateway_ids" {
  description = "NAT Gateway IDs for application VPC"
  value       = module.app_vpc.nat_gateway_ids
}
