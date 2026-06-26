#########################################
# Jenkins Security Group
#########################################

output "jenkins_sg_id" {
  description = "Jenkins Security Group ID"
  value       = aws_security_group.jenkins.id
}

#########################################
# SonarQube Security Group
#########################################

output "sonarqube_sg_id" {
  description = "SonarQube Security Group ID"
  value       = aws_security_group.sonarqube.id
}

#########################################
# Monitoring Security Group
#########################################

output "monitoring_sg_id" {
  description = "Monitoring Security Group ID"
  value       = aws_security_group.monitoring.id
}
