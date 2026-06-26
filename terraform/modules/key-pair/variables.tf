#########################################
# Environment
#########################################

variable "environment" {
  description = "Deployment environment"
  type        = string
}

#########################################
# Key Pair Configuration
#########################################

variable "key_name" {
  description = "AWS EC2 Key Pair Name"
  type        = string
}

variable "public_key_path" {
  description = "Path to the SSH public key file"
  type        = string
}
