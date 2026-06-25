# Employee Platform - Production Architecture

## Cloud Provider
- AWS

## Infrastructure as Code
- Terraform

## Containerization
- Docker

## Container Orchestration
- Kubernetes (EKS)

## GitOps
- ArgoCD

## CI
- Jenkins

## Source Code
- GitHub

## Code Quality
- SonarQube

## Security Scan
- Trivy

## Container Registry
- Amazon ECR

## Ingress
- NGINX Ingress Controller

## TLS
- cert-manager + Let's Encrypt

## Secrets Management
- Kubernetes Secrets
- GitHub Secrets
- Jenkins Credentials

## Monitoring
- Prometheus
- Grafana

## Logging
- Loki
- Promtail

## DNS
- Route53

## Load Balancer
- AWS Application Load Balancer

## Application

Frontend

Backend

MySQL Database

## Deployment Strategy

Rolling Update

## Branch Strategy

main

develop

feature/*


## AWS Network

### VPC

CIDR : 10.0.0.0/16

### Public Subnets

10.0.1.0/24

10.0.2.0/24

### Private Subnets

10.0.11.0/24

10.0.12.0/24