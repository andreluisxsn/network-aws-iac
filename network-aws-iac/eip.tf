resource "aws_eip" "eip_env" {
  depends_on = [aws_internet_gateway.igw_env]
  vpc        = true
  tags = {
    Name        = "badops-eip-dev"
    terraformed = "true"
  }
}