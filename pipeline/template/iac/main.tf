provider "aws" {
  region = "us-east-2"
}

module "vpc" {
  source  = "./vpc"
}



module "subnet" {
  source  = "./subnet"
  vpc_id = module.vpc.vpc_id
}

