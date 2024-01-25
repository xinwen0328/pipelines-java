provider "aws" {
  region = "us-east-2"
}

module "vpc" {
  source  = "./vpc"
  stage = "var.stage"
}



module "subnet" {
  source  = "./subnet"
  vpc_id = module.vpc.vpc_id
  stage = "var.stage"
}

