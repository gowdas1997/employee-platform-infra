########################################
# VPC
########################################

output "vpc_id" {
  description = "VPC ID"
  value       = aws_vpc.main.id
}

########################################
# Public Subnets
########################################

output "public_subnet_ids" {
  description = "List of Public Subnet IDs"
  value = [
    aws_subnet.public_subnet_1.id,
    aws_subnet.public_subnet_2.id
  ]
}

output "public_subnet_1_id" {
  description = "Public Subnet 1 ID"
  value       = aws_subnet.public_subnet_1.id
}

output "public_subnet_2_id" {
  description = "Public Subnet 2 ID"
  value       = aws_subnet.public_subnet_2.id
}

########################################
# Private Application Subnets
########################################

output "private_app_subnet_ids" {
  description = "List of Private Application Subnet IDs"
  value = [
    aws_subnet.private_app_subnet_1.id,
    aws_subnet.private_app_subnet_2.id
  ]
}

output "private_app_subnet_1_id" {
  description = "Private Application Subnet 1 ID"
  value       = aws_subnet.private_app_subnet_1.id
}

output "private_app_subnet_2_id" {
  description = "Private Application Subnet 2 ID"
  value       = aws_subnet.private_app_subnet_2.id
}

########################################
# Private Database Subnets
########################################

output "private_db_subnet_ids" {
  description = "List of Private Database Subnet IDs"
  value = [
    aws_subnet.private_db_subnet_1.id,
    aws_subnet.private_db_subnet_2.id
  ]
}

output "private_db_subnet_1_id" {
  description = "Private Database Subnet 1 ID"
  value       = aws_subnet.private_db_subnet_1.id
}

output "private_db_subnet_2_id" {
  description = "Private Database Subnet 2 ID"
  value       = aws_subnet.private_db_subnet_2.id
}

########################################
# Internet Gateway
########################################

output "internet_gateway_id" {
  description = "Internet Gateway ID"
  value       = aws_internet_gateway.main.id
}

########################################
# NAT Gateway
########################################

output "nat_gateway_id" {
  description = "NAT Gateway ID"
  value       = aws_nat_gateway.main.id
}

########################################
# Route Tables
########################################

output "public_route_table_id" {
  description = "Public Route Table ID"
  value       = aws_route_table.public.id
}

output "private_app_route_table_id" {
  description = "Private Application Route Table ID"
  value       = aws_route_table.private_app.id
}

output "private_db_route_table_id" {
  description = "Private Database Route Table ID"
  value       = aws_route_table.private_db.id
}