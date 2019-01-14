#!/usr/bin/env bash
source env.sh

terraform plan \
 -var worker_ami="${WORKER_AMI}" \
 -var worker_keypair="${WORKER_KEYPAIR}"\
 -var workstation_key="${WORKSTATION_KEY}"\
 -var availability_zone="${AVALIABILITY_ZONE}"

 terraform apply \
 -var worker_ami="${WORKER_AMI}" \
 -var worker_keypair="${WORKER_KEYPAIR}"\
 -var workstation_key="${WORKSTATION_KEY}"\
 -var availability_zone="${AVALIABILITY_ZONE}"