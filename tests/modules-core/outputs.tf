############################
##### Shared Core Data #####
############################

output "admin_accounts" {
  description = "Names of the administrator accounts"
  value       = module.shared.admin_accounts
}

# From the deploy.tf special S3 bucket
output "deploy_bucket" {
  description = "Shared Deploy Bucket name"
  value       = module.shared.deploy_bucket
}

output "deploy_bucket_rw_arn" {
  description = "Shared Deploy Bucket Read/write policy ARN"
  value       = module.shared.deploy_bucket_rw_arn
}

# From the initial Route 53 configuration
output "public_zoneid" {
  description = "Route53 Public Zone ID"
  value       = module.shared.public_zoneid
}

output "public_zonename" {
  description = "Route53 Public Zone name"
  value       = module.shared.public_zonename
}

output "domain" {
  description = "The name of the domain for this AWS account"
  value = module.shared.domain
}

# From the initial ACM global certificate configuration
output "testdevmitlib_cert_arn" {
  description = "*.testdevmitlib.net wildcard certificate ARN"
  value       = module.shared.testdevmitlib_cert_arn 
}