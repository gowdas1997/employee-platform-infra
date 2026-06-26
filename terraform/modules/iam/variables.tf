variable "environment" {
  description = "Deployment environment"
  type        = string
}

variable "ec2_role_name" {
  description = "IAM Role name for EC2 instances"
  type        = string
  default     = "employee-platform-ec2-role"
}

variable "instance_profile_name" {
  description = "IAM Instance Profile name"
  type        = string
  default     = "employee-platform-ec2-instance-profile"
}
