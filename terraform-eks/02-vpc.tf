resource "aws_vpc" "main" {
  cidr_block = var.aws_vpc_cidr_block


  tags = {
    Name = "main"
  }
}