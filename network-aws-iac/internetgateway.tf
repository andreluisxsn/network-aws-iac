resource "aws_internet_gateway" "igw_env" {
  vpc_id = aws_vpc.badops_vpc.id

  tags = {
    Name        = "badops-igw-dev"
    terraformed = "true"
  }
}