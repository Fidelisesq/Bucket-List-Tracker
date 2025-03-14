# Configure AWS Provider
provider "aws" {
  region = var.region  # Use the variable for the AWS region
}

# AWS Amplify App for hosting the React frontend
resource "aws_amplify_app" "bucket_list_app" {
  name       = "BucketListTracker"
  repository = var.github_repository  # Use the variable for the GitHub repository URL
  platform   = "WEB"
  oauth_token = var.oauth_token  # Ensure this is set up correctly

  build_spec = <<EOF
version: 1
applications:
  - frontend:
      phases:
        preBuild:
          commands:
            - npm install
        build:
          commands:
            - npm run build
      artifacts:
        baseDirectory: build
        files:
          - '**/*'
      cache:
        paths:
          - node_modules/**/*
EOF
}

# Associate Custom Domain with AWS Amplify
resource "aws_amplify_domain_association" "custom_domain" {
  app_id      = aws_amplify_app.bucket_list_app.id
  domain_name = var.custom_domain  

  sub_domain {
    prefix       = var.subdomain_prefix  
    branch_name  = var.amplify_branch   
  }
}

# Create a Route 53 CNAME Record for the Subdomain
resource "aws_route53_record" "lifely_tracker_cname" {
  zone_id = var.hosted_zone_id  # Use the variable for the Route 53 hosted zone ID
  name    = "${var.subdomain_prefix}.${var.custom_domain}"  # Combine subdomain and domain
  type    = "CNAME"
  ttl     = 120
  records = [aws_amplify_app.bucket_list_app.default_domain]
}

# AWS Cognito User Pool for managing user authentication
resource "aws_cognito_user_pool" "bucket_list_auth" {
  name = var.cognito_user_pool_name  # Use the variable for the Cognito User Pool name
}

# AWS Cognito User Pool Client for handling application authentication
resource "aws_cognito_user_pool_client" "app_client" {
  name         = var.cognito_client_name  # Use the variable for the Cognito Client name
  user_pool_id = aws_cognito_user_pool.bucket_list_auth.id
}

# AWS DynamoDB Table for storing bucket list items
resource "aws_dynamodb_table" "bucket_list" {
  name         = var.dynamodb_table_name  # Use the variable for the DynamoDB table name
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "id"
  attribute {
    name = "id"
    type = "S"
  }
}

# AWS AppSync GraphQL API for interacting with DynamoDB
resource "aws_appsync_graphql_api" "bucket_list_api" {
  name                = var.appsync_api_name  # Use the variable for the AppSync API name
  authentication_type = "AMAZON_COGNITO_USER_POOLS"

  user_pool_config {
    user_pool_id    = aws_cognito_user_pool.bucket_list_auth.id
    default_action = "ALLOW"  # This allows authenticated users to access the API
  }
}

# AWS S3 Bucket for storing files or images related to the bucket list
resource "aws_s3_bucket" "bucket_list_storage" {
  bucket = var.s3_bucket_name  # Use the variable for the S3 bucket name
}

# Output the Amplify App URL
output "amplify_app_url" {
  value = aws_amplify_app.bucket_list_app.default_domain
}
