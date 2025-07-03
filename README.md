# CloudLite App – AWS Free Tier Infrastructure

## Technologies Used
| Component  | AWS Service         | Reason            |
|------------|---------------------|-------------------|
| Compute    | EC2 (t2.micro)      | Free Tier         |
| Storage    | S3 + Lifecycle      | Free Tier         |
| Container  | ECR                 | 500MB Free Tier   |
| Infra      | Terraform           | Free/Open Source  |
| CI/CD      | GitHub Actions      | Free              |
| Monitoring | CloudWatch + Trail  | Free Tier         |

## Cost Optimization Decisions
- No ALB or Route 53
- Used public IP directly
- No NAT Gateway (only public subnets)
- CloudWatch used for minimal logs
- SQLite/DynamoDB instead of RDS

## Deliverables Summary
- Terraform code [✅]
- Docker + CI/CD [✅]
- CloudWatch logs [✅]
- EC2 app screenshot [✅]
- S3 lifecycle screenshot [✅]
- CloudTrail screenshot [✅]

