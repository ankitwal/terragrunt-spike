remote_state {
  backend = "s3"
  config = {
    region  =  "ap-southeast-1"
    bucket  =  "terragrunt-spike-state"
    key     =  "${path_relative_to_include()}/terraform.tfstate"
  }
}
