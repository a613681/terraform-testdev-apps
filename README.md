# MIT Libraries TestDev Terraform Config - Apps

**TESTDEV**     **TESTDEV**     **TESTDEV**     **TESTDEV**     **TESTDEV**

**TESTDEV**     **TESTDEV**     **TESTDEV**     **TESTDEV**     **TESTDEV**

This repo contains the TestDev Terraform application testing structure for MIT Libraries.

## Workspaces

In our primary repo, we maintain both **stage** and **prod** workspaces for most resources. In the Test/Dev Apps repo, we maintain, respectively, **dev** and **test** workspaces. If you have not configured a specific workspace, Terraform will use the **default** workspace. Your workspace can be configured by setting the `TF_WORKSPACE` environment variable, or explicitly switching workspaces with the `terraform workspace select` command.

## Layout

    apps/
      |- app1/
      |- app2/
      |- app3/
    modules/
      |- tf-testdev-mod-shared/
      |- module2/
      |- ...
    scripts/
    tests/
    backend.hcl

### The apps Directory

This directory is where any application infrastructure testing takes place. Each subfolder in here should correspond to a subfolder in **mitlib-terraform**, our production repository. When developing code, each subfolder should directly correlate with a feature branch on the repository. Each app subfolder should have both a `dev.tfvars` and a `test.tfvars` file.

### The modules Directory

In our **mitlib-terraform** production repository, we often depend on the **tf-mod-shared** external repository. This is designed to read all the shared remote state output variables from the core infrastructure. In this repository, we have a local (internal) module named **tf-testdev-mod-shared** that functions similarly. It reads the remote state outputs from the **terraform-testdev-bootstrap** and **terraform-testdev-core** repositories.

## Migrating code

When copying an app subfolder from **mitlib-terraform** to **terraform-testdev-apps**, the following issues must be addressed.

### Remote State Backend

The code in **mitlib-terraform** includes the S3 remote backend explicitly in each application folder's `main.tf` folder. In the Dev/Test repository, there is a `backend.hcl` folder at the top level that contains the details of the remote state location. This has two consequences.

1. The `terraform { }` block needs only one line: `key = apps/<name_of_app>.terraform`
2. The `terraform init` command must be called with `backend-config=../../backend.hcl` to load the correct backend state details.

### "Shared" module usage

The code in **mitlib-terraform** uses the **tf-mod-shared** external module to load the outputs from the remote state of shared resources (VPCs, subnets, etc...). For the Test/Dev environment, you must use the local `./modules/tf-testdev-mod-shared` module to load the remote state outputs. This module call is typically in the `main.tf` file and must be updated before running `terraform init`.

### Variables

The **mitlib-terraform** repository uses `stage.tfvars` and `prod.tfvars` along with the **stage** and **prod** workspaces for managing the two sets of resources. For the Test/Dev environment, these variable files are **dev.tfvars** and **test.tfvars**, respectively. 

In the Stage/Prod environment, copies of the variable files are stored in an S3 bucket and are manually copied to a local workstation for testing and deployment. In the Test/Dev environment, we are testing the use of Parameter Store for the remote storage of variables. There are currently some issues with this, in regard to automatically running `terraform plan` via GitHub Actions (mostly related to storing structured data in variables).