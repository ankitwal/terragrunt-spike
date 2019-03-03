variable "worker_ami" {
  default = "ami-070bdb8798e3aeba7"
}

variable "worker_key" {}

variable "workers_count" {
}

resource "aws_key_pair" "worker-keypair" {
  key_name   = "${var.project} worker-key"
  public_key = "${var.worker_key}"
}

resource "aws_security_group" "worker_sg" {
  name        = "${var.project} worker seccurity group"
  description = "Allow incoming traffic from Workstation and Other Workers"
  vpc_id      = "${aws_vpc.vpc.id}"

  ingress {
    from_port       = 0
    to_port         = 0
    protocol        = -1
    self            = true
    security_groups = ["${aws_security_group.workstation_sg.id}"]
  }
}

resource "aws_launch_configuration" "worker_launch_config" {
  name            = "${var.project} worker tempalte"
  image_id        = "${var.worker_ami}"
  instance_type   = "t3.medium"
  vpc_security_group_ids = ["${aws_security_group.worker_sg.id}"]
  key_name        = "${aws_key_pair.worker-keypair.key_name}"

}

resource "aws_autoscaling_group" "worker_group" {
  name = "${var.project} workers autoscaling group"
  availability_zones  = ["${var.availability_zone}"]
  desired_capacity    = "${var.workers_count}"
  max_size            = "${var.workers_count}"
  min_size            = "${var.workers_count}"
  vpc_zone_identifier = ["${aws_subnet.private.id}"]

  launch_configuration= "${aws_launch_configuration.worker_launch_config.name}"

  tags = [
    {
      key                 = "Name"
      value               = "${var.project} worker"
      propagate_at_launch = true
    },
    {
      key                 = "Project"
      value               = "${var.project}"
      propagate_at_launch = true
    },
  ]
}
