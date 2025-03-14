# Define the AWS region for the provider
variable "region" {
  description = "The AWS region to create resources in"
  type        = string
  default = "us-east-1"
}

# GitHub repository URL for the React frontend
variable "github_repository" {
  description = "The GitHub repository URL for the frontend app"
  type        = string
  default     = "https://github.com/Fidelisesq/Bucket-List-Tracker"
}

# The custom domain to be associated with the Amplify app
variable "custom_domain" {
  description = "The custom domain name for the app"
  type        = string
  default     = "fozdigitalz.com"
}

# Subdomain prefix for the custom domain
variable "subdomain_prefix" {
  description = "The prefix to use for the subdomain"
  type        = string
  default     = "lifely-tracker"
}

# The branch name for Amplify deployment
variable "amplify_branch" {
  description = "The branch of the GitHub repo to be deployed"
  type        = string
  default     = "main"
}

# Route 53 hosted zone ID for creating the CNAME record
variable "hosted_zone_id" {
  description = "The hosted zone ID in Route 53"
  type        = string
}

# AWS Cognito User Pool name
variable "cognito_user_pool_name" {
  description = "The name of the Cognito User Pool"
  type        = string
  default     = "bucket-list-user-pool"
}

# AWS Cognito User Pool Client name
variable "cognito_client_name" {
  description = "The name of the Cognito User Pool Client"
  type        = string
  default     = "bucket-list-client"
}

# DynamoDB table name for storing bucket list items
variable "dynamodb_table_name" {
  description = "The name of the DynamoDB table"
  type        = string
  default     = "BucketListTable"
}

# AWS AppSync API name for the bucket list GraphQL API
variable "appsync_api_name" {
  description = "The name of the AWS AppSync GraphQL API"
  type        = string
  default     = "BucketListGraphQLAPI"
}

# The name of the S3 bucket for storing files
variable "s3_bucket_name" {
  description = "The name of the S3 bucket for storing files"
  type        = string
  default     = "bucket-list-app-storage"
}
