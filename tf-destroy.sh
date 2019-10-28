#!/usr/bin/env bash
source env.sh

terraform plan -destroy\
 -var workstation_key="${WORKSTATION_KEY}"\
 -var worker_key="${WORKER_KEY}"\
 -var worker_ami="${WORKER_AMI}"\
 -var workstation_ami="${WORKSTATION_AMI}"\
 -var availability_zone="${AVALIABILITY_ZONE}"\
 -var workers_count=${WORKERS_COUNT}


terraform destroy \
 -var workstation_key="${WORKSTATION_KEY}"\
 -var worker_key="${WORKER_KEY}"\
 -var worker_ami="${WORKER_AMI}"\
 -var workstation_ami="${WORKSTATION_AMI}"\
 -var availability_zone="${AVALIABILITY_ZONE}"\
 -var workers_count=${WORKERS_COUNT}
