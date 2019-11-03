resource "aws_key_pair" "workstation-keypair" {
  key_name   = "workstation-key"
  public_key = var.workstation_key
}

resource "aws_instance" "workstation" {
  instance_type               = "t3.micro"
  ami                         = var.workstation_ami
  subnet_id                   = aws_subnet.public.id
  associate_public_ip_address = true
  vpc_security_group_ids      = [aws_security_group.workstation_sg.id]
  key_name                    = aws_key_pair.workstation-keypair.key_name
  user_data = file("resources/workstation_user_data.sh")

//  provisioner "file" {
//    source = "resources/lf258-worker"
//    destination = "/home/ec2-user/lf258-worker"
//  }

  tags = {
    Name    = "${var.project} workstation"
    Project = var.project
  }
}

resource "aws_security_group" "workstation_sg" {
  name        = "${var.project} workstation seccurity group"
  description = "Allow incoming traffic on 22 ssh"
  vpc_id      = aws_vpc.vpc.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = var.workstation_ip_whitelist
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}


