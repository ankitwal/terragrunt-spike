terraform {
  backend "s3" {
    region = "ap-southeast-1"
    bucket = "lf258-tf-state"
    key    = "tf-state/"
  }
}

provider "aws" {
  region = "ap-southeast-1"
}

variable "region_numbers" {
  type = "map"
  default = {
    ap-southeast-1 = 1
  }
}

variable "az_numbers" {
  type = "map"
  default = {
    a = 1
    b = 2
    c = 3
  }
}

