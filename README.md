# GitHub Actions Security Lab

This repository contains **intentionally vulnerable code** for practicing security scanning with GitHub Actions.

**DO NOT use this code in production. These vulnerabilities are for educational purposes only.**

## What's Inside

This repository includes several types of security issues:

| File | Vulnerability Type |
|------|-------------------|
| `package.json` | Outdated dependencies with known CVEs |
| `config.js` | Hardcoded secrets (AWS keys, database credentials, API keys) |
| `Dockerfile` | Container running as root |
| `terraform/main.tf` | Infrastructure misconfigurations (public S3, open SSH, unencrypted DB) |

## How to Use This Repository

### Step 1: Fork the Repository

Click the **Fork** button in the top-right corner to create your own copy.

### Step 2: Create a Working Branch

After forking, create a new branch for your security lab work:

```bash
git clone https://github.com/YOUR-USERNAME/Github-Actions-Lab.git
cd Github-Actions-Lab
git checkout -b security-lab
git push -u origin security-lab
```

**Why use a branch?**
- Keeps the vulnerable baseline on `main` for reference
- Allows you to create Pull Requests and see security scan comments
- Simulates real-world development workflow
- You can compare "before" and "after" states

### Step 3: Add Security Workflows

On your `security-lab` branch, create workflows in `.github/workflows/`:

1. **Gitleaks** - Detects hardcoded secrets
2. **Trivy** - Scans dependencies, containers, and infrastructure code

Follow the lab instructions to create and configure these workflows.

### Step 4: Create a Pull Request

After adding workflows, create a PR from `security-lab` to `main` to see:
- Security scan results as PR comments
- Status checks blocking merge
- Detailed findings in the Security tab

## Expected Vulnerabilities

When you run security scans, you should find:

### Secrets (Gitleaks)
- AWS Access Key ID
- AWS Secret Access Key
- Database connection string with password
- Stripe API key
- JWT secret

### Dependencies (Trivy)
- lodash: CVE-2020-8203, CVE-2021-23337 (Prototype Pollution)
- axios: CVE-2021-3749 (ReDoS)
- minimist: CVE-2021-44906 (Prototype Pollution)

### Infrastructure (Trivy IaC)
- S3 bucket with public access enabled
- Security group with SSH open to 0.0.0.0/0
- RDS instance without encryption
- RDS instance publicly accessible
- Hardcoded database password

## Lab Exercises

1. **Secret Detection** - Configure Gitleaks to find hardcoded secrets
2. **Dependency Scanning** - Set up Trivy to detect vulnerable packages
3. **Container Scanning** - Build and scan the Docker image
4. **IaC Scanning** - Detect Terraform misconfigurations
5. **Security Pipeline** - Combine all scans into a complete security gate
6. **Remediation** - Fix the vulnerabilities and verify scans pass

## Important Notes

- GitHub Actions is **free for public repositories**
- The Security tab requires the repository to be public OR have GitHub Advanced Security enabled
- SARIF upload requires `security-events: write` permission

## Resources

- [Trivy Documentation](https://aquasecurity.github.io/trivy/)
- [Gitleaks](https://github.com/gitleaks/gitleaks)
- [GitHub Code Scanning](https://docs.github.com/en/code-security/code-scanning)

## Disclaimer

This repository is for **educational purposes only**. The vulnerabilities, secrets, and misconfigurations are intentional and should never be used in real applications. All secrets in this repository are fake/example values.

