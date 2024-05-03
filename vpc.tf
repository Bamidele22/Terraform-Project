resource "aws_vpc" "neutron" {
  cidr_block           = "10.0.0.0/16"
  instance_tenancy     = "default"
  enable_dns_hostnames = "true"
  enable_dns_support   = "true"

  tags = {
    Name = "neutron"
  }
}

resource "aws_subnet" "neutron-pub-1" {
  vpc_id                  = aws_vpc.neutron.id
  cidr_block              = "10.0.1.0/24"
  availability_zone       = var.ZONE1
  map_public_ip_on_launch = "true"

  tags = {

    Name = "neutron-pub-1"
  }
}

resource "aws_subnet" "neutron-pub-2" {
  vpc_id                  = aws_vpc.neutron.id
  cidr_block              = "10.0.2.0/24"
  availability_zone       = var.ZONE2
  map_public_ip_on_launch = "true"

  tags = {

    Name = "neutron-pub-2"
  }
}

resource "aws_subnet" "neutron-pub-3" {
  vpc_id                  = aws_vpc.neutron.id
  cidr_block              = "10.0.3.0/24"
  availability_zone       = var.ZONE3
  map_public_ip_on_launch = "true"

  tags = {

    Name = "neutron-pub-3"
  }
}

resource "aws_subnet" "neutron-pri-1" {
  vpc_id                  = aws_vpc.neutron.id
  cidr_block              = "10.0.4.0/24"
  availability_zone       = var.ZONE1
  map_public_ip_on_launch = "true"

  tags = {
    Name = "neutron-pri-1"
  }
}

resource "aws_subnet" "neutron-pri-2" {
  vpc_id                  = aws_vpc.neutron.id
  cidr_block              = "10.0.5.0/24"
  availability_zone       = var.ZONE2
  map_public_ip_on_launch = "true"

  tags = {
    Name = "neutron-pri-2"
  }
}

resource "aws_subnet" "neutron-pri-3" {
  vpc_id                  = aws_vpc.neutron.id
  cidr_block              = "10.0.6.0/24"
  availability_zone       = var.ZONE3
  map_public_ip_on_launch = "true"

  tags = {
    Name = "neutron-pri-3"
  }

}

resource "aws_internet_gateway" "neutron-IGW" {
  vpc_id = aws_vpc.neutron.id

  tags = {
    Name = "neutron-IGW"
  }

}

resource "aws_route_table" "neutron-RT" {
  vpc_id = aws_vpc.neutron.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.neutron-IGW.id
  }

  tags = {
    Name = "neutron-RT"
  }
}

resource "aws_route_table_association" "neutron-pub-1-a" {
  subnet_id      = aws_subnet.neutron-pub-1.id
  route_table_id = aws_route_table.neutron-RT.id
}

resource "aws_route_table_association" "neutron-pub-2-a" {
  subnet_id      = aws_subnet.neutron-pub-2.id
  route_table_id = aws_route_table.neutron-RT.id
}

resource "aws_route_table_association" "neutron-pub-3-a" {
  subnet_id      = aws_subnet.neutron-pub-3.id
  route_table_id = aws_route_table.neutron-RT.id
}





