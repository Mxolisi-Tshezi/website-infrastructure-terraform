
# Website Infrastructure - Terraform Project

## Overview
This repository contains the Terraform configuration files which has code required to deploy and manage the infrastructure for a website. The infrastructure is modular and includes components for:

- **ACM (AWS Certificate Manager)**: For managing SSL/TLS certificates.
- **CloudFront**: For content delivery.
- **Route 53**: For DNS management.
- **S3**: For static website hosting or asset storage.

## Project Structure

```
website-infrastructure-terraform/
|-- Modules/
|   |-- acm/
|   |   |-- main.tf
|   |   |-- outputs.tf
|   |   |-- variables.tf
|   |-- cloudfront/
|   |   |-- main.tf
|   |   |-- outputs.tf
|   |   |-- variables.tf
|   |-- route53/
|   |   |-- main.tf
|   |   |-- outputs.tf
|   |   |-- variables.tf
|   |-- s3/
|   |   |-- main.tf
|   |   |-- outputs.tf
|   |   |-- variables.tf
|-- _dev/
|   |-- backend.tf
|   |-- main.tf
|   |-- provider.tf
|-- README.md
```

### Modules
- **acm/**: Contains the Terraform configuration for provisioning SSL/TLS certificates.
- **cloudfront/**: Manages CloudFront distribution for content delivery.
- **route53/**: Configures DNS settings using Route 53.
- **s3/**: Creates and configures S3 buckets for storage.

### _dev
This folder contains the main entry point for Terraform configuration, including backend configuration, provider setup, and resource orchestration.

## Prerequisites

- Terraform CLI installed on your local machine.
- AWS CLI installed and configured with the necessary permissions.
- An S3 bucket for storing Terraform state.

## Usage

1. Clone the repository:
   ```bash
   git clone https://github.com/Mxolisi-Tshezi/website-infrastructure-terraform.git
   
   cd website-infrastructure-terraform
   ```

2. Initialize Terraform:
   ```bash
   terraform init
   ```

3. Validate the configuration:
   ```bash
   terraform validate
   ```

4. Plan the infrastructure:
   ```bash
   terraform plan
   ```

5. Apply the configuration:
   ```bash
   terraform apply
   ```

6. Destroy the infrastructure (if needed):
   ```bash
   terraform destroy
   ```

## Infrastructure Architecture Diagram

![Infrastructure Architecture Diagram](/Images/Architecture-image.png)