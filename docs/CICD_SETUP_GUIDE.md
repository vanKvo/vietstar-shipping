# CI/CD Pipeline Setup Guide

This project leverages GitHub Actions to perform continuous deployment (CD) directly to our AWS Lightsail server. Instead of manually SSHing into the server to pull code and restart containers, this pipeline completely automates the process every time code is merged into the `main` branch.

## How It Works
1. **Trigger:** A push or pull request merge to the `main` branch.
2. **Bundle:** A GitHub runner securely zips the `business_portal` and `database` directories.
3. **Transmit:** The runner connects to the AWS Lightsail server over SSH via SCP and securely deposits the new code.
4. **Deploy:** The runner triggers remote commands to unzip the code, rebuild the PHP container image (`docker compose build`), and perform a rolling update (`docker compose up -d`) to ensure zero-downtime.

## Setup Instructions

In order for GitHub Actions to authenticate into your AWS server, you must provide it with the server's public IP address and the private SSH key used by Terraform to provision it.

1. Go to your repository on **GitHub**.
2. Click on the **Settings** tab.
3. On the left sidebar, expand **Secrets and variables**, then click **Actions**.
4. Click the green **New repository secret** button.
5. Create the following two secrets:

### Secret 1: Server IP
* **Name:** `AWS_HOST_IP`
* **Secret:** Your AWS Lightsail Server's Public IP Address (e.g., `3.216.133.196`). *Note: Do not include the port number like `:8081`.*

### Secret 2: Private SSH Key
* **Name:** `SSH_PRIVATE_KEY`
* **Secret:** The complete, raw text of your private SSH key (usually located at `~/.ssh/aws_vietstar_shipping_key` locally). Be sure to include the `-----BEGIN OPENSSH PRIVATE KEY-----` and `-----END OPENSSH PRIVATE KEY-----` lines.

## Triggering a Deployment
Once those secrets are saved, CI/CD is active. You can trigger a deployment by:
1. Pushing new commits to the `main` branch.
2. Navigating to the **Actions** tab in GitHub, selecting "Production Deployment," and clicking **Run workflow** (Manual Trigger).

---
## Troubleshooting
* **SSH Connection Refused:** Ensure the AWS Lightsail Firewall strictly allows TCP Port `22` traffic.
* **Containers Not Updating:** Ensure `docker-compose.yml` does not have syntax errors, as a malformed file will cause the `docker compose up -d` command in the pipeline to abort.
