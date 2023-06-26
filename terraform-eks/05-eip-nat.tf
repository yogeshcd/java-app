resource "aws_eip" "main" {
  vpc = true

  tags = {
    "Name" : "nat"
  }
}

resource "aws_nat_gateway" "main" {
  allocation_id = aws_eip.main.id
  subnet_id     = aws_subnet.public-us-east-1a.id

  tags = {
    Name = "nat"
  }

  # To ensure proper ordering, it is recommended to add an explicit dependency
  # on the Internet Gateway for the VPC.
  depends_on = [aws_internet_gateway.main]
}


