terraform {
  source = ""
}
include {
  path = find_in_parent_folders()
}
inputs = {
  project = "terragrunt-spike"
  availability_zone = "ap-southeast-1c"
  workstation_ami = "ami-05b3bcf7f311194b3"
  workstation_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQC0uRz3DC7gv6XUT5gP0QYUGxKnd3lGIKq4oey0JH/NWDISuESkc3DnwiElJ0AoUNMMPg4phG8kvWiV3n7djvLNiQwJr18XWcrJAFUXc4ELzz+NJPBmeBpNcZHLgL1/4Xk39VZ/T2ZhC6aZadsEnnp8iTU4zOrReVarwDF2glEzfbeq5js1aOVF7tpoiQNlNPHF0f0qpyFG5Dp0U9bGAqZVUbOZZJ1eARl1VTq0ZQRrCW6K5rS9cQbNvyh0Xg04mWrvXaXdXpFm53yF9ZHso/zX+rmXWiWJC5aWrfmeNOxKqQbcCvK5edpyGyKvUkChVUeXYCTdCA8SEWG6xRLgFmXf sgankitwal@SGankitwal.local"

  worker_ami = "ami-070bdb8798e3aeba7"
  worker_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDEdoyT6pTCFgICJgJJ1HSCSC3T0UFClBFq+LJp/4UVyIt6lfu8Vj2ynSRiVenrbmbVwkNsS0MDbxBFdFZAIAy9j1PdacMZ7CEmNgagtjvPTOaP9AY1GvU09FRI/0B3wc3hDgmUS94ohozE2qrCID7aJb/QZBh4TwbeaN9y/zOOurhC5Q9LcOviv3ZCL9knVB3qoM42+R4u3kGcx+x4fUn4Rr3bPExYuEBcJQ5AELZ1gNz2Wuiv1uVmTBlg6kv/5odahYFF1NPt+eBNliHJctaZIpEzNnK+h67c0pTcC+0Wh6EBCR+7y6a6bBngmeJjM7lYfVr/kwcPnhctS2YDZuQD sgankitwal@SGankitwal.local"
  workers_count = 2
}
