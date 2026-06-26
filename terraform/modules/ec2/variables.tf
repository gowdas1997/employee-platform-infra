#########################################
# Environment
#########################################

variable "environment" {
  description = "Deployment environment"
  type        = string
}

#########################################
# EC2 Configuration
#########################################

variable "instance_name" {
  description = "EC2 Instance Name"
  type        = string
}

variable "ami_id" {
  description = "AMI ID for EC2 Instance"
  type        = string
}

variable "instance_type" {
  description = "EC2 Instance Type"
  type        = string
}

variable "key_name" {
  description = "EC2 Key Pair Name"
  type        = string
}

#########################################
# Networking
#########################################

variable "subnet_id" {
  description = "Subnet ID"
  type        = string
}

variable "security_group_ids" {
  description = "List of Security Group IDs"
  type        = list(string)
}

variable "associate_public_ip_address" {
  description = "Associate Public IP Address"
  type        = bool
  default     = true
}

#########################################
# IAM
#########################################

variable "iam_instance_profile" {
  description = "IAM Instance Profile Name"
  type        = string
}

#########################################
# Storage
#########################################

variable "root_volume_size" {
  description = "Root Volume Size (GB)"
  type        = number
  default     = 30
}

variable "root_volume_type" {
  description = "Root Volume Type"
  type        = string
  default     = "gp3"
}

#########################################
# EC2 Options
#########################################

variable "ebs_optimized" {
  description = "Enable EBS Optimization"
  type        = bool
  default     = true
}

variable "enable_detailed_monitoring" {
  description = "Enable Detailed Monitoring"
  type        = bool
  default     = false
}

variable "disable_api_termination" {
  description = "Enable API Termination Protection"
  type        = bool
  default     = false
}

#########################################
# User Data
#########################################

variable "user_data" {
  description = "User Data Script"
  type        = string
  default     = null
}