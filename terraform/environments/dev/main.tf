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


#########################################
# Jenkins Key Pair
#########################################

module "jenkins_key" {
  source = "../../modules/key-pair"

  environment = var.environment

  key_name = "employee-platform-dev-jenkins-key"

  public_key_path = local.jenkins_public_key_path
}


#########################################
# SonarQube Key Pair
#########################################

module "sonarqube_key" {
  source = "../../modules/key-pair"

  environment = var.environment

  key_name = "employee-platform-dev-sonarqube-key"

  public_key_path = local.sonarqube_public_key_path
}


#########################################
# Monitoring Key Pair
#########################################

module "monitoring_key" {
  source = "../../modules/key-pair"

  environment = var.environment

  key_name = "employee-platform-dev-monitoring-key"

  public_key_path = local.monitoring_public_key_path
}


#########################################
# Jenkins EC2
#########################################

module "jenkins_ec2" {

  source = "../../modules/ec2"

  #######################################
  # General
  #######################################

  environment   = var.environment
  instance_name = "employee-platform-dev-jenkins"

  #######################################
  # AMI
  #######################################

  ami_id = data.aws_ami.ubuntu.id

  #######################################
  # Compute
  #######################################

  instance_type = var.jenkins_instance_type

  #######################################
  # Networking
  #######################################

  subnet_id = local.jenkins_subnet_id

  security_group_ids = [
    local.jenkins_sg_id
  ]

  associate_public_ip_address = true

  #######################################
  # SSH
  #######################################

  key_name = module.jenkins_key.key_name

  #######################################
  # IAM
  #######################################

  iam_instance_profile = local.ec2_instance_profile

  #######################################
  # Storage
  #######################################

  root_volume_size = 30
  root_volume_type = "gp3"

  #######################################
  # EC2 Options
  #######################################

  ebs_optimized              = true
  enable_detailed_monitoring = false
  disable_api_termination    = false

  #######################################
  # User Data
  #######################################

  user_data = file("${path.root}/../../../scripts/jenkins-user-data.sh")
}