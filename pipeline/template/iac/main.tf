provider "aws" {
  region = "us-east-2"
}

module "vpc" {
  source  = "vpc"
}

module "subnet" {
  source  = "subnet"
}

