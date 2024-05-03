resource "aws_security_group" "neutron_stack-SG" {
  name        = "neutron_stack-SG"
  description = "SG for neutron ssh"
  vpc_id      = aws_vpc.neutron.id

    egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = [var.MYIP]
  }


  tags = {
    Name = "allow-ssh"
  }
}

