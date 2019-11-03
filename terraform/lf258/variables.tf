variable "vpc_index" {
  description = "Vpc index for cird block"
  default     = "1"
}

variable "project" {
  #default = "lf258"
}

variable "availability_zone" {
  description = "availability Zone"
}

# Work Station
variable "workstation_ami" {
  default = "ami-05b3bcf7f311194b3"
}

variable "workstation_key" {
}

# Worker
variable "worker_ami" {
  default = "ami-070bdb8798e3aeba7"
}

variable "worker_key" {
}

variable "workers_count" {
}

variable "workstation_ip_whitelist" {
  type = list(string)
  default = []
}
