# AWS Lightsail Deployment Guide

This guide walks you through deploying your `business_portal` application to an Amazon Lightsail instance (1 GB RAM, 2 vCPUs, Dual Stack IPv4/IPv6) using Terraform, destroying it to prevent ongoing costs, and understanding the portability to Oracle Cloud.

## 1. Prerequisites

You will need the AWS CLI authenticated and Terraform installed on your machine.
If you haven't deployed using AWS Terraform before, verify your AWS profile is active:
```bash
aws configure
```

## 2. Generate an SSH Key
Terraform needs an SSH key path explicitly given to securely beam the package to the server. If you do not have a dedicated cloud key, generate one:
```bash
ssh-keygen -t rsa -b 2048 -f ~/.ssh/aws_vietstar_shipping_key
```

## 3. Configure Terraform Variables
Inside your new `terraform_aws` directory, create your configuration file:
1. Rename the example file:
   ```bash
   cp terraform_aws/terraform.tfvars.example terraform_aws/terraform.tfvars
   ```
2. Open `terraform_aws/terraform.tfvars` and paste the contents of `~/.ssh/aws_vietstar_shipping_key.pub` into `ssh_public_key`. Make sure `ssh_private_key_path` points to your `~/.ssh/aws_vietstar_shipping_key`.

You can find your public key inside the .pub file, e.g., `~/.ssh/aws_vietstar_shipping_key.pub`, which was generated alongside your private key when you ran the ssh-keygen command.

## 4. Deploy Infrastructure

Navigate into the directory to build the stack:
```bash
cd terraform_aws
terraform init
terraform plan
terraform apply
```
*Note: Type `yes` when prompted. Terraform will automatically compress the `business_portal` and `database` directories into a zip file, provision the server, secure the firewall ports (80, 8081, 22), copy the zip, unzip it, and initiate Docker Compose.*

At the end of the deployment, the console will output standard IPv4/IPv6 addresses and a direct URL to view the live portal. Example:
`portal_url = "http://123.45.67.89:8081"`

---

## 5. Removing the Infrastructure (Cost Optimization)
The beauty of IaC is avoiding unexpected bills. When the demo is over and you want to ensure AWS doesn't charge you that $5 for the next month, you can completely erase the deployment with a single command:

```bash
terraform destroy
```
*Note: Type `yes` when prompted. AWS will terminate the Lightsail instance and release the public IPs, officially stopping all billing related to this demo.*

---

## Migrating from AWS to Oracle Cloud Free Tier

**How easy is it to switch to Oracle if you decide you want the 100% free server later?**

It is incredibly easy—almost entirely seamless. This is because we dockerized your architecture.
Whether you choose AWS Lightsail or the Oracle Ampere A1 VM, the underlying "host" environment is essentially just an empty Ubuntu shell whose sole purpose is running the Docker engine.

If you deploy to AWS and decide to switch to Oracle tomorrow:
1. Run `terraform destroy` in your `terraform_aws` folder.
2. Ensure your Oracle API keys are set up.
3. Run `terraform apply` in your `terraform_oracle` folder.

Your application code, PHP version, MySQL version, and tracking logic operate in a vacuum *inside* the containers. **Zero lines of application code need to change.** The only difference will be the public IP address the system outputs at the end.
