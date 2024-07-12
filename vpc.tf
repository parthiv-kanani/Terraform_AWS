resource "aws_vpc" "the" {
  cidr_block           = "10.0.0.0/16"
  instance_tenancy     = "default"
  enable_dns_support   = "true"
  enable_dns_hostnames = "true"
  tags = {
    Name = "the-vpc"
  }
}

resource "aws_subnet" "the-pub-1" {
  vpc_id                  = aws_vpc.the.id
  cidr_block              = "10.0.1.0/24"
  map_public_ip_on_launch = "true"
  availability_zone       = var.ZONE1
  tags = {
    Name = "the-pub-1"
  }
}

resource "aws_subnet" "the-pub-2" {
  vpc_id                  = aws_vpc.the.id
  cidr_block              = "10.0.2.0/24"
  map_public_ip_on_launch = "true"
  availability_zone       = var.ZONE2
  tags = {
    Name = "the-pub-2"
  }
}

resource "aws_subnet" "the-pub-3" {
  vpc_id                  = aws_vpc.the.id
  cidr_block              = "10.0.3.0/24"
  map_public_ip_on_launch = "true"
  availability_zone       = var.ZONE3
  tags = {
    Name = "the-pub-3"
  }
}

resource "aws_subnet" "the-priv-1" {
  vpc_id                  = aws_vpc.the.id
  cidr_block              = "10.0.4.0/24"
  map_public_ip_on_launch = "true"
  availability_zone       = var.ZONE1
  tags = {
    Name = "the-priv-1"
  }
}

resource "aws_subnet" "the-priv-2" {
  vpc_id                  = aws_vpc.the.id
  cidr_block              = "10.0.5.0/24"
  map_public_ip_on_launch = "true"
  availability_zone       = var.ZONE2
  tags = {
    Name = "the-priv-2"
  }
}

resource "aws_subnet" "the-priv-3" {
  vpc_id                  = aws_vpc.the.id
  cidr_block              = "10.0.6.0/24"
  map_public_ip_on_launch = "true"
  availability_zone       = var.ZONE3
  tags = {
    Name = "the-priv-3"
  }
}

resource "aws_internet_gateway" "the-IGW" {
  vpc_id = aws_vpc.the.id

  tags = {
    Name = "the-IGW"
  }
}


resource "aws_route_table" "the-pub-RT" {
  vpc_id = aws_vpc.the.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.the-IGW.id
  }

  tags = {
    Name = "the-pub-RT"
  }
}

resource "aws_route_table_association" "the-pub-1-a" {
  subnet_id      = aws_subnet.the-pub-1.id
  route_table_id = aws_route_table.the-pub-RT.id
}

resource "aws_route_table_association" "the-pub-2-a" {
  subnet_id      = aws_subnet.the-pub-2.id
  route_table_id = aws_route_table.the-pub-RT.id
}

resource "aws_route_table_association" "the-pub-3-a" {
  subnet_id      = aws_subnet.the-pub-3.id
  route_table_id = aws_route_table.the-pub-RT.id
}

