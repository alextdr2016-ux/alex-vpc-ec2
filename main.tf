terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
}

provider "aws" {
  region = var.aws_region

  skip_credentials_validation = true
  skip_metadata_api_check     = true
}

resource "aws_vpc" "alex" {
  cidr_block       = var.vpc_cidr
  instance_tenancy = "default"

  tags = {
    Name = "alex"
  }
}


resource "aws_subnet" "alex_subnet" {
  vpc_id                  = aws_vpc.alex.id
  cidr_block              = var.subnet_cidr
  availability_zone       = "eu-north-1a"
  map_public_ip_on_launch = true
  tags = {
    Name = "alex_subnet"
  }
}
resource "aws_internet_gateway" "alex_igw" {
  vpc_id = aws_vpc.alex.id

  tags = {
    Name = "alex_igw"
  }
}
resource "aws_route_table" "alex_rt" {
  vpc_id = aws_vpc.alex.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.alex_igw.id
  }
  tags = {
    Name = "alex_route_table"
  }
}
resource "aws_route_table_association" "a" {
  subnet_id      = aws_subnet.alex_subnet.id
  route_table_id = aws_route_table.alex_rt.id
}

resource "aws_security_group" "alex_sg" {
  name        = "alex_sg"
  description = "Allow SSH and HTTP"
  vpc_id      = aws_vpc.alex.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "alex_sg"
  }
}
resource "aws_instance" "alex_instance" {
  ami                         = var.ami_id
  instance_type               = var.instance_type
  subnet_id                   = aws_subnet.alex_subnet.id
  vpc_security_group_ids      = [aws_security_group.alex_sg.id]
  key_name                    = "generalkeypair" # Replace with your key pair name
  associate_public_ip_address = true

  tags = {
    Name = "alex_instance"
  }
}