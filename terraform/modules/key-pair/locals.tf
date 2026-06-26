locals {
  common_tags = {
    Environment = var.environment
    Project     = "employee-platform"
    ManagedBy   = "Terraform"
    Owner       = "Platform-Team"
  }
}
