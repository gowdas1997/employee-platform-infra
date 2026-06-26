########################################
# AWS
########################################

variable "aws_region" {
  description = "AWS Region"
  type        = string
}

########################################
# VPC
########################################

variable "vpc_name" {
  description = "VPC Name"
  type        = string
}

variable "vpc_cidr" {
  description = "VPC CIDR"
  type        = string
}

variable "environment" {
  description = "Environment Name"
  type        = string
}

########################################
# Public Subnets
########################################

variable "public_subnet_1_cidr" {
  description = "Public Subnet 1 CIDR"
  type        = string
}

variable "public_subnet_2_cidr" {
  description = "Public Subnet 2 CIDR"
  type        = string
}

########################################
# Private Application Subnets
########################################

variable "private_app_subnet_1_cidr" {
  description = "Private Application Subnet 1 CIDR"
  type        = string
}

variable "private_app_subnet_2_cidr" {
  description = "Private Application Subnet 2 CIDR"
  type        = string
}

########################################
# Private Database Subnets
########################################

variable "private_db_subnet_1_cidr" {
  description = "Private Database Subnet 1 CIDR"
  type        = string
}

variable "private_db_subnet_2_cidr" {
  description = "Private Database Subnet 2 CIDR"
  type        = string
}

########################################
# Availability Zones
########################################

variable "availability_zone_1" {
  description = "Availability Zone 1"
  type        = string
}

variable "availability_zone_2" {
  description = "Availability Zone 2"
  type        = string
}


#########################################
# IAM
#########################################

variable "ec2_role_name" {
  description = "EC2 IAM Role Name"
  type        = string
}

variable "instance_profile_name" {
  description = "EC2 Instance Profile Name"
  type        = string
}

########### Ec2 ###########
variable "jenkins_instance_type" {
  description = "Instance type for Jenkins EC2"
  type        = string
  default     = "t3.large"
}