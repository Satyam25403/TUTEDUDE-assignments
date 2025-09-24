# Application Deployment with Terraform

This repository contains Terraform configurations to deploy a web application stack (backend and frontend) using AWS services. The stack includes Dockerized Flask (backend) and Express (frontend) applications, deployed on AWS ECS with an Application Load Balancer (ALB) and VPC networking.

---

## **Table of Contents**

- [Architecture](#architecture)
- [Prerequisites](#prerequisites)
- [Terraform Configuration](#terraform-configuration)
- [Deployment Steps](#deployment-steps)
- [Cleanup](#cleanup)

---

## **Architecture**

```text
             ┌─────────────┐
             │ ALB         │
             │ (Public)    │
             └─────┬───────┘
                   │
        ┌──────────┴───────────┐
        │                      │
 ┌──────┴──────┐        ┌──────┴──────┐
 │ ECS Service │        │ ECS Service │
 │ Flask       │        │ Express     │
 │ (Backend)   │        │ (Frontend)  │
 └─────────────┘        └─────────────┘
       │                      │
  Docker Containers        Docker Containers

```


## **Architecture**
Backend: Flask API running on port 5000
Frontend: Express app running on port 3000


## **Prerequisites**
AWS Account with sufficient permissions.
AWS CLI configured locally.
Terraform installed (version >= 1.5 recommended).
Docker images for backend and frontend pushed to ECR.





## **Deployment Steps**

### Initialize Terraform:
```bash
terraform init
```

### Plan the and save the deployment:
```bash
terraform plan -out=tfplan
```

### Apply the configuration:
```bash
terraform apply (plan: if plan exists)
```

### Cleanup:
```bash
terraform destroy
```
