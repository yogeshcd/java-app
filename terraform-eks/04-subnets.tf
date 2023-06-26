resource "aws_subnet" "public-us-east-1a" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.aws_subnet_public_cidr_blocks[0]
  availability_zone = var.aws_subnet_public_availability_zones[0]
  tags = {
    Name                     = "Main"
    "kubernetes.io/role/elb" = "1"
  }
}

resource "aws_subnet" "public-us-east-1b" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.aws_subnet_public_cidr_blocks[1]
  availability_zone = var.aws_subnet_public_availability_zones[1]

  tags = {
    "Name"                   = "Main"
    "kubernetes.io/role/elb" = "1"
  }
}

resource "aws_subnet" "private-us-east-1a" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.aws_subnet_private_cidr_blocks[0]
  availability_zone = var.aws_subnet_private_availability_zones[0]

  tags = {
    Name                              = "Main"
    "kubernetes.io/role/internal-elb" = "1"
  }
}

resource "aws_subnet" "private-us-east-1b" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.aws_subnet_private_cidr_blocks[1]
  availability_zone = var.aws_subnet_private_availability_zones[1]

  tags = {
    "Name"                            = "Main"
    "kubernetes.io/role/internal-elb" = "1"
  }
}