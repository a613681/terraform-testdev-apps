provider "aws" {
  version = "~> 2.0"
  region  = var.aws_region
}

# IMPORTANT: the key MUST be changed to match the name of this app
# IMPORTANT: the -backend-file=../../backend.hcl option MUST be used when running terraform plan
#   and terraform apply
terraform {
  backend "s3" {
    key            = "shared/test-core.tfstate"
  }
}

# This will be used to capture output date from the ./shared/core remote state
 module "shared" {
   source = "../../modules/tf-testdev-mod-shared"
 }