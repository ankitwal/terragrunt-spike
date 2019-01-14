variable "workstation_ami" {
  default = "ami-05b3bcf7f311194b3"
}

variable "workstation_key" {
  
}


resource "aws_instance" "workstation" {
  instance_type               = "t3.micro"
  ami                         = "${var.workstation_ami}"
  subnet_id                   = "${aws_subnet.public.id}"
  associate_public_ip_address = true
  security_groups             = ["${aws_security_group.workstation_sg.id}"]
  key_name                    = "${aws_key_pair.workstation-keypair.key_name}"

  tags {
    Name    = "${var.project} workstation"
    Project = "${var.project}"
  }
}

resource "aws_security_group" "workstation_sg" {
  name        = "${var.project} workstation seccurity group"
  description = "Allow incoming traffic on 22 ssh"
  vpc_id      = "${aws_vpc.vpc.id}"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_key_pair" "workstation-keypair" {
  key_name   = "workstation-key"
  public_key = "${var.workstation_key}"
}
