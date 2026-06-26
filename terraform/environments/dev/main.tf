module "vpc" {
  source = "../../modules/vpc"

  vpc_name    = var.vpc_name
  vpc_cidr    = var.vpc_cidr
  environment = var.environment

  public_subnet_1_cidr = var.public_subnet_1_cidr
  public_subnet_2_cidr = var.public_subnet_2_cidr

  private_app_subnet_1_cidr = var.private_app_subnet_1_cidr
  private_app_subnet_2_cidr = var.private_app_subnet_2_cidr

  private_db_subnet_1_cidr = var.private_db_subnet_1_cidr
  private_db_subnet_2_cidr = var.private_db_subnet_2_cidr

  availability_zone_1 = var.availability_zone_1
  availability_zone_2 = var.availability_zone_2
}


#########################################
# Security Groups Module
#########################################

module "security_groups" {
  source = "../../modules/security-groups"

  environment = var.environment
  vpc_id      = module.vpc.vpc_id

  allowed_ssh_cidr = "0.0.0.0/0"
}


#########################################
# IAM Module
#########################################

module "iam" {
  source = "../../modules/iam"

  environment           = var.environment
  ec2_role_name         = var.ec2_role_name
  instance_profile_name = var.instance_profile_name
}