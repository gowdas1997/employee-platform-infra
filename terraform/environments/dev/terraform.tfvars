aws_region = "us-east-1"

vpc_name = "employee-dev-vpc"

vpc_cidr = "10.0.0.0/16"

environment = "dev"

public_subnet_1_cidr = "10.0.1.0/24"
public_subnet_2_cidr = "10.0.2.0/24"

private_app_subnet_1_cidr = "10.0.11.0/24"
private_app_subnet_2_cidr = "10.0.12.0/24"

private_db_subnet_1_cidr = "10.0.21.0/24"
private_db_subnet_2_cidr = "10.0.22.0/24"

availability_zone_1 = "us-east-1a"
availability_zone_2 = "us-east-1b"

ec2_role_name         = "employee-platform-dev-ec2-role"
instance_profile_name = "employee-platform-dev-instance-profile"

jenkins_instance_type = "t3.large"