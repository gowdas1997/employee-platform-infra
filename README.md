# Employee Platform Infrastructure

## Overview

This repository contains the Infrastructure as Code (IaC), Kubernetes manifests, Helm charts, Jenkins pipeline definitions, and deployment configurations for the Employee Platform.

## Technology Stack

- AWS
- Terraform
- Kubernetes
- Helm
- Jenkins
- Docker
- SonarQube
- Trivy
- Argo CD
- Prometheus
- Grafana

## Repository Structure

```
terraform/
kubernetes/
helm/
jenkins/
scripts/
docs/
architecture/
.github/
```

## Architecture

Production Grade GitOps Architecture

```
GitHub
   │
   ▼
 Jenkins
   │
   ├── SonarQube
   ├── Trivy
   ├── Docker Build
   ├── Docker Push
   └── Update GitOps Repository
                │
                ▼
             Argo CD
                │
                ▼
           Amazon EKS
                │
                ▼
     Employee Platform
```