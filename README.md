# Employee Platform Infrastructure

## Overview

This repository provisions the complete AWS infrastructure for the Employee Platform using Terraform.

The infrastructure follows enterprise Terraform best practices with:

- Modular architecture
- Remote Terraform State
- Environment-based deployments
- Reusable modules
- Production-ready project structure

---

# AWS Region

- Region: us-east-1 (N. Virginia)

---

# Remote Backend

Terraform state is stored securely using:

- Amazon S3
- Amazon DynamoDB (State Locking)

Bootstrap repository:

employee-platform-bootstrap

Resources:

- S3 Bucket
- DynamoDB Table
- Versioning Enabled
- AES256 Server Side Encryption
- Public Access Blocked

---

# Repository Structure

```
employee-platform-infra/
│
├── architecture/
│
├── terraform/
│   │
│   ├── environments/
│   │     └── dev/
│   │          ├── backend.tf
│   │          ├── main.tf
│   │          ├── provider.tf
│   │          ├── variables.tf
│   │          └── terraform.tfvars
│   │
│   └── modules/
│         ├── vpc/
│         ├── security-groups/
│         └── iam/
│
├── .gitignore
└── README.md
```

---

# Completed Modules

## VPC Module

Resources Created

- VPC
- Internet Gateway
- NAT Gateway
- Public Route Table
- Private Application Route Table
- Private Database Route Table
- Public Subnets (2)
- Private Application Subnets (2)
- Private Database Subnets (2)

---

## Security Groups Module

Resources Created

### Jenkins

- SSH (22)
- HTTP (8080)

### SonarQube

- SSH (22)
- HTTP (9000)

### Monitoring

- SSH (22)
- Grafana (3000)
- Prometheus (9090)

---

## IAM Module

Resources Created

### IAM Role

- EC2 Assume Role Policy

### IAM Instance Profile

Attached to EC2 Instances

### AWS Managed Policies

- AmazonSSMManagedInstanceCore
- CloudWatchAgentServerPolicy
- AmazonEC2ContainerRegistryReadOnly

---

# Deployment Workflow

```bash
terraform init

terraform fmt -recursive

terraform validate

terraform plan

terraform apply
```

---

# Current Infrastructure

Completed

- Remote Backend
- VPC
- Internet Gateway
- NAT Gateway
- Route Tables
- Public Subnets
- Private Application Subnets
- Private Database Subnets
- Security Groups
- IAM Roles
- IAM Instance Profile

---

# Upcoming Modules

- EC2
- Application Load Balancer
- Auto Scaling
- RDS
- ACM
- Route53
- CloudWatch
- SNS
- ECR
- CI/CD Integration

---

# Terraform Best Practices Used

- Modular Design
- Remote Backend
- State Locking
- Environment Separation
- Reusable Modules
- Common Tags
- Outputs
- Variables
- Git Version Control

---

# Author

**Sudarshan K R**

GitHub:
https://github.com/gowdas1997