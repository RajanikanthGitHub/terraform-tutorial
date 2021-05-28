# What is Terraform Backend?

* Storing terraform state file in remote location in order to work multiple developers at a time. so that backend will be called always from remote location.

* Each Terraform configuration can specify a backend, which defines where and how operations are performed, where state snapshots are stored, etc.

* If you are still learning how to use Terraform, we recommend using the default local backend, which requires no configuration.
* If you and your team are using Terraform to manage meaningful infrastructure, we recommend using the remote backend with Terraform Cloud or Terraform Enterprise.

## What Backends Do

There are two areas of Terraform's behavior that are determined by the backend:

* Where state is stored.
* Where operations are performed.

## Backend Types

### 1. Enhanced

backends can both store state and perform operations. There are only two enhanced backends: local and remote.

### 2. Standard

backends only store state, and rely on the local backend for performing operations.

```terraform
terraform plan -var-file dev.tfvars 
terraform apply -var-file dev.tfvars -auto-complete
```
