#########################################
# Common Resource References
#########################################

locals {

  #######################################
  # Subnets
  #######################################

  jenkins_subnet_id    = module.vpc.public_subnet_1_id
  sonarqube_subnet_id  = module.vpc.public_subnet_2_id
  monitoring_subnet_id = module.vpc.public_subnet_2_id

  #######################################
  # Security Groups
  #######################################

  jenkins_sg_id    = module.security_groups.jenkins_sg_id
  sonarqube_sg_id  = module.security_groups.sonarqube_sg_id
  monitoring_sg_id = module.security_groups.monitoring_sg_id

  #######################################
  # IAM
  #######################################

  ec2_instance_profile = module.iam.instance_profile_name

  #######################################
  # Public Key Paths
  #######################################

  jenkins_public_key_path    = "/home/ubuntu/.ssh/employee-platform/employee-platform-dev-jenkins.pub"
  sonarqube_public_key_path  = "/home/ubuntu/.ssh/employee-platform/employee-platform-dev-sonarqube.pub"
  monitoring_public_key_path = "/home/ubuntu/.ssh/employee-platform/employee-platform-dev-monitoring.pub"
}