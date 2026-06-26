#########################################
# EC2 IAM Role
#########################################

output "ec2_role_name" {
  description = "EC2 IAM Role Name"
  value       = aws_iam_role.ec2_role.name
}

output "ec2_role_arn" {
  description = "EC2 IAM Role ARN"
  value       = aws_iam_role.ec2_role.arn
}

#########################################
# EC2 Instance Profile
#########################################

output "instance_profile_name" {
  description = "EC2 Instance Profile Name"
  value       = aws_iam_instance_profile.ec2_instance_profile.name
}

output "instance_profile_arn" {
  description = "EC2 Instance Profile ARN"
  value       = aws_iam_instance_profile.ec2_instance_profile.arn
}
