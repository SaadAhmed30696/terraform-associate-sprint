# Terraform AWS Infrastructure & State Management Sprint

An intensive, hands-on implementation of Infrastructure as Code (IaC) best practices utilizing HashiCorp Terraform and Amazon Web Services (AWS). This repository serves as a practical testing environment for tracking configuration drift, managing state snapshot files, and breaking down monolithic cloud components into modular, decoupled resources.

Built as part of an accelerated engineering sprint aligning with the core objectives of the **HashiCorp Certified: Terraform Associate (TA-004)** certification platform.

---

##  Architecture Overview

This project provisions a standard, secure cloud compute and storage baseline inside a regional AWS environment. It shifts traditional manual console workflows into declarative HCL templates.

* **Compute:** Dynamic deployment of an AWS EC2 instance (`t3.micro`) tracking active runtime values like public IP addresses, subnet locations, and security group bindings.
* **Storage & Security:** Decoupled provisioning of Amazon S3 buckets managing granular permissions. Migrates obsolete inline configurations into modern, isolated standalone components (`aws_s3_bucket_acl`) to eliminate destructive environment recreation cycles.
* **Telemetry & Outputs:** Automated calculations of underlying infrastructure metadata surfaced instantly via standard CLI outputs.

---

##  Key Technical Insights & Roadblocks Solved

* **Dependency Lock Reconciliation:** Resolved state synchronization mismatches between pessimistic provider constraints (`~> 5.0`) and auto-generated lock files (`.terraform.lock.hcl` tracking `6.x` updates) utilizing targeted upstream engine upgrades (`terraform init -upgrade`).
* **Resource Decoupling & Monolithic Migration:** Implemented modern HashiCorp best practices by isolating discrete sub-components (such as `aws_s3_bucket_acl`) away from monolithic, deprecated inline resource bindings to eliminate unnecessary drift detection overhead.
* **Workspace Git Boundaries:** Engineered native environment tracking safeguards using structural `.gitignore` pattern masking to ensure zero leakage of binary execution state files (`.tfstate`) to public version control systems.
---
## 🛠️ Built With

* **Infrastructure as Code:** HashiCorp Terraform (HCL)
* **Cloud Platform:** Amazon Web Services (AWS)
* **Version Control & CI/CD Engine:** Git / GitHub CLI (`gh`)
* **Development Environment:** Visual Studio Code on Windows (PowerShell/AMD64)

---


## Repository Structure

```text
├── .gitignore             # Strict boundary excluding binary state assets and runtime cache
├── backend.tf             # Core remote storage and execution architecture instructions
├── main.tf                # Primary resource declarations (EC2 compute baseline, S3 storage blocks)
├── provider.tf            # Pessimistic version constraints (~> 6.0) targeting official HashiCorp engines
├── variables.tf           # Strongly typed input schemas defining environment scale boundaries
├── terraform.tfvars       # Isolated parameter arguments matching live workspace footprints
└── outputs.tf             # Calculated telemetry matrices extracted directly from the state snapshot
```
---

## 🔒 Security & Git Boundary Controls
To ensure production-grade security, this workspace establishes an explicit git boundary via .gitignore.

Local state files (terraform.tfstate), provider plugins (.terraform/), and variable matrices containing sensitive parameter keys are permanently restricted to the local development environment. This strictly prevents plain-text infrastructure schemas, administrative credentials, or unique AWS access footprints from leaking to public remote tracking trees.

## 🚀 Core Workspace Deployment Blueprint
Follow these sequential execution phases to initialize, plan, and execute this workspace on your local terminal:

| Step | Phase & Objective | Core Execution Command |
| :--- | :--- | :--- |
| **1.** | **Initialize Working Directory**<br>Downloads specific binary plugins, reads structural provider constraints, and links the execution engine to the local workspace. | `terraform init` |
| **2.** | **Validate & Verify Configuration Spec**<br>Performs native syntax parsing, tracks internal variable declarations, and ensures compliance with upstream HCL definitions. | `terraform validate` |
| **3.** | **Generate Execution Blueprint**<br>Executes a dry-run structural evaluation mapping active templates against live cloud assets to calculate delta changes. | `terraform plan` |
| **4.** | **Execute Cloud Deployment**<br>Applies structural updates to the active AWS target profile and registers output telemetry strings directly inside the state manager. | `terraform apply` |
| **5.** | **Tear Down Infrastructure**<br>Gracefully destroys all provisioned remote resources tracked under the current state workspace to prevent idle cloud billing leaks. | `terraform destroy` |