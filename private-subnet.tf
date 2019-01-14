resource "aws_subnet" "private" {
  vpc_id     = "${aws_vpc.vpc.id}"
  cidr_block = "${cidrsubnet(aws_vpc.vpc.cidr_block, 8, 1+100)}"

  tags {
    Name    = "${var.project} ${var.availability_zone} private subnet"
    Project = "${var.project}"
  }
}

resource "aws_eip" "nat" {
  vpc   = true
}

resource "aws_nat_gateway" "nat" {
  allocation_id = "${aws_eip.nat.id}"
  subnet_id     = "${aws_subnet.public.id}"
  depends_on = ["aws_internet_gateway.ig"]
  tags = {
    Name    = "${var.project} NAT"
    Project = "${var.project}"
  }
}