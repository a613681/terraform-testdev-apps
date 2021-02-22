# Module tf_mod_shared_core

This module provides a layer of abstraction to accessing shared resources. It does not itself create any resources or maintain any state, it simply reads the state files of various shared resources. The goal is to hide some of the uglier, repetitive config blocks behind a clean interface.

When you add a new shared resource, you will also need to update this module with whatever outputs you want to provide access to.

Run `terraform-docs markdown table . --no-providers --no-requirements >> README.md` to append the updated Input and Output tables to this document

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| admins | A list of IAM accounts to add to the administrators group | `list` | `[]` | no |
| aws\_region | The default region for our Test/Dev environment. | `string` | `"us-east-1"` | no |
| domain | Domain name for environment | `string` | n/a | yes |
| users | A list of IAM accounts to create (usernames) | `list` | `[]` | no |
| zone\_id | Zone ID of default zone created by domain registration | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| admin\_accounts | Names of the administrator accounts |
| deploy\_bucket | Bucket name |
| deploy\_bucket\_rw\_arn | Read/write policy ARN |
| domain | The name of the domain for this AWS account |
| public\_zoneid | Route53 Public Zone ID |
| public\_zonename | Route53 Public Zone name |
| testdevmitlib\_cert\_arn | \*.testdevmitlib.net wildcard certificate ARN |
