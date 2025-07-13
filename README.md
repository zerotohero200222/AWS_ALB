# 🚀 Terraform ALB Deployment on AWS

## 📌 Project Overview

This repository is designed to provision and manage an **Application Load Balancer (ALB)** infrastructure on AWS using **Terraform**. It supports environment-based deployments (e.g., `dev`, `uat`, `prod`) and is integrated with **GitHub Actions** for CI/CD automation. The infrastructure state is securely stored in **Amazon S3** with versioning and encryption enabled.

---


## 🌐 Infrastructure Components

* **VPC** with a CIDR range (`10.0.0.0/16`)
* **Public Subnets** in two availability zones
* **Internet Gateway** and routing setup
* **Security Group** allowing HTTP (port 80) access
* **Application Load Balancer** with:

  * Access logging enabled to an S3 bucket
  * Deletion protection
* **S3 Bucket** for storing ALB logs
* **Terraform state backend** in a secure, versioned, and encrypted S3 bucket

---

## 🔧 GitHub Actions CI/CD

The deployment workflow automates the following:

1. **S3 Bucket Initialization:**

   * Checks and creates the S3 backend bucket if it doesn't exist.
   * Enables versioning and encryption for Terraform state files.

2. **Terraform Plan:**

   * Initializes Terraform
   * Executes a plan using environment-specific `.tfvars`
   * Uploads the generated plan as an artifact
   * Provides a cost summary of estimated resources

3. **Terraform Apply:**

   * Requires **manual approval** in GitHub Environments
   * Downloads and applies the pre-generated plan file

> ✅ All secrets (`AWS_ACCESS_KEY_ID`, `AWS_SECRET_ACCESS_KEY`) must be securely stored in GitHub repository secrets.

---

## 🌍 Supported Environments

* **Development (`dev`)**
* **User Acceptance Testing (`uat`)**
* **Production (`prod`)**

Each environment has its own `.tfvars` file under the `environments/` directory, allowing for isolated and configurable deployments.

---

## 📤 Remote Backend (State Management)

The Terraform state is managed using an **S3 backend**, enabling:

* Team collaboration
* State locking (if configured with DynamoDB)
* Version tracking
* Secure and centralized management

Each environment stores its state under a unique key path (e.g., `alb/dev/terraform.tfstate`).

---

## 📦 Outputs

After successful deployment, Terraform provides outputs such as:

* **ALB DNS Name** – to access the load balancer
* **S3 Bucket Name** – used for logging access logs

These outputs are useful for further integration, testing, or reference in application configuration.

---

## ✅ Prerequisites

* An AWS account with necessary IAM permissions
* GitHub repository with the required secrets
* Terraform CLI (>= 1.3.0)
* AWS CLI (for local backend initialization, if needed)

---

## 🧪 How to Use

1. **Clone the repository**
2. **Customize the `.tfvars` files** inside the `environments/` folder
3. **Push changes to `main` branch**
4. **Review Terraform Plan** in the GitHub Actions tab
5. **Approve and execute Terraform Apply** via the `dev-approval` environment

---

## 🔐 Security Considerations

* State files are stored in **versioned and encrypted** S3 buckets
* AWS credentials are managed via **GitHub Secrets**
* Access logs are stored in **private S3 buckets** only accessible by AWS ALB service

---

## 📈 Cost Estimation

Basic estimated monthly costs for the `dev` environment:

| Resource          | Quantity | Monthly Estimate |
| ----------------- | -------- | ---------------- |
| Application LB    | 1        | \~\$18.00        |
| S3 Logging Bucket | 1        | \~\$0.10         |

**Total:** \~\$18.10/month (approximate)

> 💡 Use cost estimation tools or AWS Pricing Calculator for precise figures.

---



