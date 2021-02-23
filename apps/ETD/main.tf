provider "aws" {
  version = "~> 2.0"
  region  = var.region
}

# IMPORTANT: the key MUST be changed to match the name of this app
# IMPORTANT: the -backend-file=../../backend.hcl option MUST be used when running terraform init
terraform {
  backend "s3" {
    key = "apps/etd-83.tfstate"
  }
}

module "shared" {
  source = "../../modules/tf-testdev-mod-shared"
}
