# # store the terraform state file in s3
# terraform {
#   backend "s3" {
#     bucket   = "cicd-terraform-state-bucket"
#     key      = "build/terraform.tfstate"
#     region   = "us-east-1"
#     role_arn = "arn:aws:iam::123456789012:role/Cloud-engineer-access"
#     # dynamodb_table = "terraform_state"
#   }
# }

# resource "aws_s3_bucket" "bucket" {
#   bucket = "moodlepipeline-terraform-state-backend"
#   versioning {
#     enabled = true
#   }
#   server_side_encryption_configuration {
#     rule {
#       apply_server_side_encryption_by_default {
#         sse_algorithm = "AES256"
#       }
#     }
#   }
#   object_lock_configuration {
#     object_lock_enabled = "Enabled"
#   }
#   tags = {
#     Name = "S3 Remote Terraform State Store"
#   }
# }

# resource "aws_dynamodb_table" "terraform-lock" {
#   name           = "terraform_state"
#   read_capacity  = 5
#   write_capacity = 5
#   hash_key       = "LockID"
#   attribute {
#     name = "LockID"
#     type = "S"
#   }
#   tags = {
#     "Name" = "DynamoDB Terraform State Lock Table"
#   }
# }