############################################ Public Route Tables ##################################################


resource "aws_route_table" "rt_public_env" {
  vpc_id = aws_vpc.badops_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw_env.id
  }

  tags = {
    Name        = "badops-rt-public-dev"
    terraformed = "true"
  }
}

resource "aws_route_table_association" "subnet-public-association-az" {
  count = var.subnets_public_total

  subnet_id      = aws_subnet.subnet_public_az.*.id[count.index]
  route_table_id = aws_route_table.rt_public_env.id

}

############################################ Private Route Tables ##################################################

resource "aws_route_table" "rt_private_env" {
  vpc_id = aws_vpc.badops_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.nat_gateway_env.id
  }

  tags = {
    Name        = "badops-rt-private-dev"
    terraformed = "true"
  }
}

resource "aws_route_table_association" "subnet-private-association-az" {
  count = var.subnets_private_total

  subnet_id      = aws_subnet.subnet_private_az.*.id[count.index]
  route_table_id = aws_route_table.rt_private_env.id

}
