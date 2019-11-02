terraform {
  # This config will be injected by terragrunt
  backend "s3" {
  }
}

provider "aws" {
  region  = "ap-southeast-1"
  version = "~> 2.0"
}


