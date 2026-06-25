locals {
  common_tags = {
    Project     = "employee-platform"
    Environment = var.environment
    ManagedBy   = "Terraform"
    Owner       = "Platform-Team"
  }
}