terraform {
  # This config will be injected by terragrunt
  backend "s3" {
  }
}

provider "aws" {
  region  = "ap-southeast-1"
  version = "2.8"
}

variable "region_numbers" {
  type = map(string)
  default = {
    ap-southeast-1 = 1
  }
}

variable "az_numbers" {
  type = map(string)
  default = {
    a = 1
    b = 2
    c = 3
  }
}

