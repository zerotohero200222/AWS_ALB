# AWS_ALB
## 📘 README.md

````markdown
# 🌐 AWS ALB Infrastructure with Terraform & GitHub Actions CI/CD

This project uses Terraform to deploy an **AWS Application Load Balancer (ALB)** with the necessary networking components and logs access data to an S3 bucket. It also includes GitHub Actions workflows for continuous deployment and destruction.

---

## 📦 Features

- VPC with subnets, route tables, and internet gateway
- Application Load Balancer (ALB)
- Security Groups to allow HTTP access
- ALB access logging to an S3 bucket
- Infrastructure tagging and naming using `random_pet` and `random_string`
- CI/CD automation via GitHub Actions:
  - `terraform-deploy.yml` – deploys infrastructure
---

## 🚀 Getting Started

### ✅ Prerequisites

* AWS Account with IAM permissions for:

  * EC2, ALB, VPC, S3, IAM, etc.
* Terraform CLI (`>= 1.2`)
* GitHub repository
* GitHub Secrets:

  * `AWS_ACCESS_KEY_ID`
  * `AWS_SECRET_ACCESS_KEY`

---

### 🛠️ Deploy Infrastructure Manually

```bash
terraform init
terraform apply -auto-approve
```

---

### 🧨 Destroy Infrastructure Manually

```bash
terraform destroy -auto-approve
```

---

## 🔄 CI/CD with GitHub Actions

### 🔧 Setup GitHub Secrets

Go to **Repo → Settings → Secrets → Actions** and add:

* `AWS_ACCESS_KEY_ID`
* `AWS_SECRET_ACCESS_KEY`

---

### 🚀 Deploy Workflow

Path: `.github/workflows/terraform-deploy.yml`

This workflow runs on every push to `main` (or manual trigger) and applies the Terraform configuration.

### 🧨 Destroy Workflow

Path: `.github/workflows/terraform-destroy.yml`

This workflow is triggered **manually** to destroy all resources.

To trigger:

1. Go to **Actions** tab in GitHub.
2. Select **Terraform Destroy** workflow.
3. Click **Run Workflow**.

---

## 📄 Outputs

After deployment, Terraform will output:

* `alb_dns_name` – Public DNS of the Load Balancer
* `s3_bucket_name` – Bucket receiving ALB logs
* `environment_tag` – Random tag used for resources

---

## ⚠️ Notes

* `enable_deletion_protection = true` on ALB must be disabled before destroying it.
* S3 bucket has `force_destroy = true` for easier cleanup.
* Resources are randomized to avoid naming conflicts.

---

