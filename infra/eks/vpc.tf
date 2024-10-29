# VPC
resource "aws_vpc" "eks_vpc" {
  cidr_block           = "10.10.0.0/16"
  enable_dns_support   = true
  enable_dns_hostnames = true
  tags = {
    Name = "eks-vpc-sherpany"
  }
}

# Internet Gateway
resource "aws_internet_gateway" "eks_igw" {
  vpc_id = aws_vpc.eks_vpc.id
  tags = {
    Name = "eks-igw-sherpany"
  }
}

# Route Table
resource "aws_route_table" "eks_route_table" {
  vpc_id = aws_vpc.eks_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.eks_igw.id
  }
}

# Public Subnet 1 (Auto-assign Public IP enabled)
resource "aws_subnet" "eks_public_subnet_1" {
  vpc_id            = aws_vpc.eks_vpc.id
  cidr_block        = "10.10.1.0/24"
  availability_zone = "us-east-2a"

  map_public_ip_on_launch = true  # Enable Auto-Assign Public IP

  tags = {
    Name = "eks-public-subnet-1-sherpany"
  }
}

# Public Subnet 2 (Auto-assign Public IP enabled)
resource "aws_subnet" "eks_public_subnet_2" {
  vpc_id            = aws_vpc.eks_vpc.id
  cidr_block        = "10.10.2.0/24"
  availability_zone = "us-east-2b"

  map_public_ip_on_launch = true  # Enable Auto-Assign Public IP

  tags = {
    Name = "eks-public-subnet-2-sherpany"
  }
}

# Route Table Association for Subnet 1
resource "aws_route_table_association" "eks_rta_1" {
  subnet_id      = aws_subnet.eks_public_subnet_1.id
  route_table_id = aws_route_table.eks_route_table.id
}

# Route Table Association for Subnet 2
resource "aws_route_table_association" "eks_rta_2" {
  subnet_id      = aws_subnet.eks_public_subnet_2.id
  route_table_id = aws_route_table.eks_route_table.id
}
