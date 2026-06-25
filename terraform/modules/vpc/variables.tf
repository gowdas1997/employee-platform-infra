variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
}

variable "vpc_name" {
  description = "Name of the VPC"
  type        = string
}

variable "environment" {
  description = "Environment name"
  type        = string
}


####################SUBNETS###########################

variable "public_subnet_1_cidr" {
  description = "Public Subnet 1 CIDR"
  type        = string
}

variable "public_subnet_2_cidr" {
  description = "Public Subnet 2 CIDR"
  type        = string
}

variable "private_app_subnet_1_cidr" {
  description = "Private App Subnet 1 CIDR"
  type        = string
}

variable "private_app_subnet_2_cidr" {
  description = "Private App Subnet 2 CIDR"
  type        = string
}

variable "private_db_subnet_1_cidr" {
  description = "Private DB Subnet 1 CIDR"
  type        = string
}

variable "private_db_subnet_2_cidr" {
  description = "Private DB Subnet 2 CIDR"
  type        = string
}

variable "availability_zone_1" {
  description = "Availability Zone 1"
  type        = string
}

variable "availability_zone_2" {
  description = "Availability Zone 2"
  type        = string
}

