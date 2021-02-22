############################
##### Shared Init Data #####
############################

# This is the only useful output from the separate repo that does the core initialization of
#   the Test/Dev environment.
output "s3_state_bucket" {
  description = "Name of the S3 bucket that holds remote state files"
  value = data.terraform_remote_state.init.outputs.s3_state_bucket_name
}

############################
##### Shared Core Data #####
############################

output "admin_accounts" {
  description = "Names of the administrator accounts"
  value       = data.terraform_remote_state.core.outputs.admin_accounts
}

# From the deploy.tf special S3 bucket
output "deploy_bucket" {
  description = "Shared Deploy Bucket name"
  value       = data.terraform_remote_state.core.outputs.deploy_bucket
}

output "deploy_bucket_rw_arn" {
  description = "Shared Deploy Bucket Read/write policy ARN"
  value       = data.terraform_remote_state.core.outputs.deploy_bucket_rw_arn
}

# From the initial Route 53 configuration
output "public_zoneid" {
  description = "Route53 Public Zone ID"
  value       = data.terraform_remote_state.core.outputs.public_zoneid
}

output "public_zonename" {
  description = "Route53 Public Zone name"
  value       = data.terraform_remote_state.core.outputs.public_zonename
}

output "domain" {
  description = "The name of the domain for this AWS account"
  value = data.terraform_remote_state.core.outputs.domain
}

# From the initial ACM global certificate configuration
output "testdevmitlib_cert_arn" {
  description = "*.testdevmitlib.net wildcard certificate ARN"
  value       = data.terraform_remote_state.core.outputs.testdevmitlib_cert_arn 
}

#######################
##### VPC OUTPUTS #####
#######################

output "vpc_id" {
  description = "VPC ID"
  value       = data.terraform_remote_state.network.outputs.vpc_id
}

output "private_subnets" {
  description = "List of VPC private subnets"
  value       = data.terraform_remote_state.network.outputs.private_subnets
}

output "public_subnets" {
  description = "List of VPC public subnets"
  value       = data.terraform_remote_state.network.outputs.public_subnets
}

output "nat_public_ips" {
  description = "List of public Elastic IPs created for AWS NAT Gateway"
  value       = data.terraform_remote_state.network.outputs.nat_public_ips
}

############################
##### Route 53 OUTPUTS #####
############################

output "private_zoneid" {
  description = "Route53 Private Zone ID"
  value       = data.terraform_remote_state.network.outputs.private_zoneid
}

output "private_zonename" {
  description = "Route53 Private Zone name"
  value       = data.terraform_remote_state.network.outputs.private_zonename
}

#######################
##### ALB OUTPUTS #####
#######################

# Restricted
output "alb_restricted_arn" {
  description = "Restricted ALB arn"
  value       = data.terraform_remote_state.network.outputs.alb_restricted_arn
}

output "alb_restricted_arn_suffix" {
  description = "The ARN suffix of the ALB"
  value       = data.terraform_remote_state.network.outputs.alb_restricted_arn_suffix
}

output "alb_restricted_name" {
  description = "Restricted ALB name"
  value       = data.terraform_remote_state.network.outputs.alb_restricted_name
}

output "alb_restricted_dnsname" {
  description = "Restricted ALB DNS name"
  value       = data.terraform_remote_state.network.outputs.alb_restricted_dnsname
}

output "alb_restricted_sgid" {
  description = "Restricted ALB security group ID"
  value       = data.terraform_remote_state.network.outputs.alb_restricted_sgid
}

output "alb_restricted_default_target_group_arn" {
  description = "Restricted ALB default target group arn"
  value       = data.terraform_remote_state.network.outputs.alb_restricted_default_target_group_arn
}

output "alb_restricted_http_listener_arn" {
  description = "Restricted ALB HTTP listener ARN"
  value       = data.terraform_remote_state.network.outputs.alb_restricted_http_listener_arn
}

output "alb_restricted_https_listener_arn" {
  description = "Restricted ALB HTTPS listener ARN"
  value       = data.terraform_remote_state.network.outputs.alb_restricted_https_listener_arn
}

output "alb_restricted_all_ingress_sgid" {
  description = "Restricted ALB security group ID allowing all ingress traffic from ALB"
  value       = data.terraform_remote_state.network.outputs.alb_restricted_all_ingress_sgid
}

output "alb_restricted_zone_id" {
  description = "Restricted ALB zone id"
  value       = data.terraform_remote_state.network.outputs.alb_restricted_zone_id
}

# Public
output "alb_public_arn" {
  description = "Public ALB arn"
  value       = data.terraform_remote_state.network.outputs.alb_public_arn
}

output "alb_public_arn_suffix" {
  description = "The ARN suffix of the ALB"
  value       = data.terraform_remote_state.network.outputs.alb_public_arn_suffix
}

output "alb_public_name" {
  description = "Public ALB name"
  value       = data.terraform_remote_state.network.outputs.alb_public_name
}

output "alb_public_dnsname" {
  description = "Public ALB DNS name"
  value       = data.terraform_remote_state.network.outputs.alb_public_dnsname
}

output "alb_public_sgid" {
  description = "Public ALB security group ID"
  value       = data.terraform_remote_state.network.outputs.alb_public_sgid
}

output "alb_public_default_target_group_arn" {
  description = "Public ALB default target group arn"
  value       = data.terraform_remote_state.network.outputs.alb_public_default_target_group_arn
}

output "alb_public_http_listener_arn" {
  description = "Public ALB HTTP listener ARN"
  value       = data.terraform_remote_state.network.outputs.alb_public_http_listener_arn
}

output "alb_public_https_listener_arn" {
  description = "Public ALB HTTPS listener ARN"
  value       = data.terraform_remote_state.network.outputs.alb_public_https_listener_arn
}

output "alb_public_all_ingress_sgid" {
  description = "Public ALB security group ID allowing all ingress traffic from ALB"
  value       = data.terraform_remote_state.network.outputs.alb_public_all_ingress_sgid
}

output "alb_public_zone_id" {
  description = "Public ALB zone id"
  value       = data.terraform_remote_state.network.outputs.alb_public_zone_id
}

