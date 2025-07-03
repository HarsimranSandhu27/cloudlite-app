#  CloudLite App – AWS Free Tier Web App Infrastructure

## Project Overview

CloudLite is a lightweight, cost-sensitive version of an e-commerce platform (like CloudMart). The goal is to deploy its web-based platform using AWS services — strictly within the **Free Tier limits** — while following best practices in **networking**, **containerization**, **security**, **CI/CD**, and **monitoring**.

This project demonstrates how to build a production-ready infrastructure using minimal-cost AWS services with complete automation using **Terraform** and **GitHub Actions**.

![Cloud Architecture](screenshots/architecture.png)

**Key Components:**
- VPC with 2 public subnets
- EC2 instance (t2.micro) hosting Dockerized app
- ECR for storing Docker image
- S3 bucket for static content with lifecycle rule
- CloudWatch Logs & Metrics
- CloudTrail for audit logging
- GitHub Actions for CI/CD
- Terraform for Infrastructure as Code

---

## Technologies & Services Used

| Component       | Technology/Service            | Free Tier? | Purpose                              |
|----------------|-------------------------------|------------|--------------------------------------|
| Compute         | EC2 (Amazon Linux 2023, t2.micro) | ✅         | Host the containerized web app       |
| Networking      | VPC, Subnets, IGW, Route Table | ✅         | Secure network infrastructure        |
| Storage         | Amazon S3                     | ✅         | Store static files                   |
| Container Repo  | Amazon ECR                    | ✅         | Store Docker images                  |
| Monitoring      | Amazon CloudWatch             | ✅         | Collect logs and metrics             |
| Audit Logging   | AWS CloudTrail                | ✅         | Track user and service activities    |
| CI/CD           | GitHub Actions                | ✅         | Build, push, and deploy Docker image |
| IaC             | Terraform                     | ✅         | Infrastructure automation            |
| Config Store    | SSM Parameter Store           | ✅         | Store app-level configs              |
| Database        | SQLite (local) / DynamoDB     | ✅         | Lightweight DB for tokens/session    |

---

## Cost-Saving Design Decisions

| Decision                            | Rationale                                                                 |
|-------------------------------------|---------------------------------------------------------------------------|
| Used only public subnets            | Avoided cost of NAT Gateway and private subnets                          |
| EC2 instead of Fargate              | Fargate is not Free Tier eligible                                         |
| No Load Balancer (ALB)              | Used public IP directly to access app                                    |
| Used Parameter Store, not Secrets Manager | Secrets Manager has a 30-day free trial only                            |
| S3 lifecycle policy enabled         | Automatically delete objects after 7 days to save space/cost             |
| Used SQLite/DynamoDB                | RDS is not truly Free Tier over time                                     |
| Skipped Route 53                    | Used EC2 public IP instead                                                |

---

## CI/CD Workflow

1. Push code to GitHub
2. GitHub Actions:
   - Builds Docker image
   - Pushes to Amazon ECR
   - Uses SSH to deploy and restart app on EC2

```yaml
.github/workflows/deploy.yml

