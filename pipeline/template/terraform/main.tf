provider "aws" {
  region = "us-east-2"
}

module "vpc" {
  source  = "./vpc"
  stage = var.stage
  vpc_name = var.vpc_name
  cidr_block = var.cidr_block
}


module "subnet" {
  source  = "./subnet"
  vpc_id = module.vpc.vpc_id
  subnet_name = var.subnet_name
  stage = var.stage
  subnet_cidr_block = var.subnet_cidr_block
}

