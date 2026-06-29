#!/bin/bash

#####################################################
# Jenkins Server Bootstrap Script
# Project : Employee Platform
# OS      : Ubuntu 24.04 LTS
#####################################################

set -euo pipefail

#####################################################
# Logging
#####################################################

exec > >(tee /var/log/jenkins-user-data.log | logger -t user-data -s 2>/dev/console) 2>&1

echo "=================================================="
echo " Jenkins User Data Script Started"
echo " Time : $(date)"
echo "=================================================="

#####################################################
# Hostname
#####################################################

hostnamectl set-hostname employee-platform-dev-jenkins

#####################################################
# System Update
#####################################################

echo "Updating Ubuntu packages..."

apt-get update -y
apt-get upgrade -y

echo "System update completed."


#####################################################
# Install Base Utilities
#####################################################

echo "Installing base utilities..."

apt-get install -y \
    curl \
    wget \
    unzip \
    jq \
    git \
    vim \
    tree \
    zip \
    ca-certificates \
    gnupg \
    lsb-release \
    software-properties-common \
    apt-transport-https

echo "Base utilities installed successfully."


#####################################################
# Install Java 21
#####################################################

echo "Installing OpenJDK 21..."

apt-get install -y openjdk-21-jdk

echo "Java installation completed."

echo "Java Version:"
java -version


#####################################################
# Install Jenkins
#####################################################

echo "Installing Jenkins..."

# Install Java Runtime (safe if already installed)
apt-get update -y
apt-get install -y fontconfig openjdk-21-jre

echo "Java Version:"
java -version

# Create keyrings directory
mkdir -p /etc/apt/keyrings

# Download Jenkins GPG Key
wget -O /etc/apt/keyrings/jenkins-keyring.asc \
https://pkg.jenkins.io/debian-stable/jenkins.io-2026.key

# Add Jenkins Repository
echo "deb [signed-by=/etc/apt/keyrings/jenkins-keyring.asc] \
https://pkg.jenkins.io/debian-stable binary/" \
| tee /etc/apt/sources.list.d/jenkins.list > /dev/null

# Update Repository
apt-get update -y

# Install Jenkins
apt-get install -y jenkins

# Enable and Start Jenkins
systemctl enable jenkins
systemctl start jenkins

echo "Jenkins installation completed."

echo "Jenkins Service Status:"
systemctl --no-pager status jenkins || true


#####################################################
# Install Docker
#####################################################

echo "Installing Docker..."

# Create Keyrings Directory
install -m 0755 -d /etc/apt/keyrings

# Add Docker GPG Key
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | \
gpg --dearmor -o /etc/apt/keyrings/docker.gpg

chmod a+r /etc/apt/keyrings/docker.gpg

# Add Docker Repository
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] \
  https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  tee /etc/apt/sources.list.d/docker.list > /dev/null

# Update Package Index
apt-get update -y

# Install Docker
apt-get install -y \
    docker-ce \
    docker-ce-cli \
    containerd.io \
    docker-buildx-plugin \
    docker-compose-plugin

# Enable Docker
systemctl enable docker
systemctl start docker

# Add Users to Docker Group
usermod -aG docker ubuntu
usermod -aG docker jenkins

echo "Docker installation completed."

echo "Docker Version:"
docker --version


#####################################################
# Install Terraform
#####################################################

echo "Installing Terraform..."

# Add HashiCorp GPG Key
wget -O- https://apt.releases.hashicorp.com/gpg | \
gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg

# Add HashiCorp Repository
echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] \
https://apt.releases.hashicorp.com \
$(lsb_release -cs) main" | \
tee /etc/apt/sources.list.d/hashicorp.list

# Update Package Index
apt-get update -y

# Install Terraform
apt-get install -y terraform

echo "Terraform installation completed."

echo "Terraform Version:"
terraform version -json | jq -r '.terraform_version'


#####################################################
# Install AWS CLI
#####################################################

echo "Installing AWS CLI..."

curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" \
-o "/tmp/awscliv2.zip"

unzip -q /tmp/awscliv2.zip -d /tmp

/tmp/aws/install --update

rm -rf /tmp/aws /tmp/awscliv2.zip

echo "AWS CLI installation completed."

aws --version


#####################################################
# Install kubectl
#####################################################

echo "Installing kubectl..."

curl -fsSL https://pkgs.k8s.io/core:/stable:/v1.33/deb/Release.key | \
gpg --dearmor -o /etc/apt/keyrings/kubernetes-apt-keyring.gpg

echo "deb [signed-by=/etc/apt/keyrings/kubernetes-apt-keyring.gpg] \
https://pkgs.k8s.io/core:/stable:/v1.33/deb/ /" | \
tee /etc/apt/sources.list.d/kubernetes.list

apt-get update -y

apt-get install -y kubectl

echo "kubectl installation completed."

kubectl version --client


#####################################################
# Install Helm
#####################################################

echo "Installing Helm..."

curl https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3 | bash

echo "Helm installation completed."

helm version

echo "==============================================="
echo "Helm installation verified."
echo "==============================================="


#####################################################
#####################################################
# Service Verification
#####################################################

echo "==============================================="
echo "Installed Versions"
echo "==============================================="

java -version

git --version

docker --version
docker info >/dev/null

terraform version -json | jq -r '.terraform_version'

aws --version

kubectl version --client --output=yaml

helm version

echo "==============================================="
echo "Service Status"
echo "==============================================="

systemctl is-enabled jenkins
systemctl is-active jenkins

systemctl is-enabled docker
systemctl is-active docker


#####################################################
# Cleanup
#####################################################

echo "Cleaning up..."

apt-get autoremove -y
apt-get autoclean

echo "Cleanup completed."


#####################################################
# Jenkins Initial Password
#####################################################

echo "==============================================="
echo "Initial Jenkins Admin Password"
echo "==============================================="

cat /var/lib/jenkins/secrets/initialAdminPassword

echo "==============================================="
echo "Jenkins Bootstrap Completed Successfully"
echo "Completed At : $(date)"
echo "==============================================="