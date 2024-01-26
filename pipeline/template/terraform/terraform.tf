terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.24.0"
    }
  }
  required_version = "~> 1.2"

  backend "s3" {
    bucket = "mysuppertfbackend"
    key    = var.backendkey
    region = "us-east-2"
  }
}