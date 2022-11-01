####################################### Private Subnets #################################################


resource "aws_subnet" "subnet_private_az" {
  count = var.subnets_private_total

  vpc_id                  = aws_vpc.badops_vpc.id
  availability_zone       = data.aws_availability_zones.available.names[count.index]
  cidr_block              = cidrsubnet("${var.cidr_env}", 8, "${count.index}")
  map_public_ip_on_launch = false

  tags = {
    "Name"      = "badops-subnet-pivate-az-one${count.index}"
    terraformed = "true"
  }
}

####################################### Public Subnets #################################################


resource "aws_subnet" "subnet_public_az" {
  count = var.subnets_public_total

  vpc_id                  = aws_vpc.badops_vpc.id
  availability_zone       = data.aws_availability_zones.available.names[count.index]
  cidr_block              = cidrsubnet("${var.cidr_env}", 8, "${var.subnets_private_total + count.index}")
  map_public_ip_on_launch = true

  tags = {
    "Name"      = "badops-subnet-public-az-one${count.index}"
    terraformed = "true"

  }
}















