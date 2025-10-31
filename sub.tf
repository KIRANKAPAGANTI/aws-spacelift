# Generate a random suffix for uniqueness
resource "random_id" "suffix" {
  byte_length = 4
}

# Create S3 bucket with unique name
resource "aws_s3_bucket" "terraform_bucket" {
  bucket = "${var.bucket_name}-${random_id.suffix.hex}"

  tags = {
    Name        = var.bucket_tag_name
    Environment = var.environment
  }
}

# Variables (already in your code)
variable "bucket_name" {
  description = "Base name for the S3 bucket"
  type        = string
  default     = "terraform-demo-bucket-assignment2"
}

variable "bucket_tag_name" {
  description = "Name tag for the S3 bucket"
  type        = string
  default     = "138267-spacelift-NewBucket"
}

variable "environment" {
  description = "Environment tag for the S3 bucket"
  type        = string
  default     = "Dev"
}
