What is Terraform Workspace?

Workspaces are Collections of Infrastructure.
Workspaces allows you same configuration with different environments.
Working with Terraform involves managing collections of infrastructure resources, and most organizations manage many different collections.

Terraform Cloud manages infrastructure collections with workspaces instead of directories. 
A workspace contains everything Terraform needs to manage a given collection of infrastructure, and separate workspaces function like completely separate working directories.

To list existing Workspaces
$ terraform workspace list

To Create new workspace
$ terraform workspace new <workspacename>
Examples:
$ terraform workspace new DEV
$ terraform workspace new PROD


To Show in Current Workspace
$ terraform workspace show

To switch one workspace to another workspace 
$ terraform workspace select <workspace name>
example:
$ terrafrom workspace select dev

To load workspace based variables in terraform
$ terraform apply -var-file dev.tfvars




