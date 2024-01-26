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
    key    = "mysuppertfbackend/dev-infraxEC2"
    region = "us-east-2"
  }
}