

resource "aws_subnet" "public" {
  count                   = 2
  vpc_id                  = aws_vpc.main.id
  cidr_block              = cidrsubnet(var.vpc_cidr, 8, count.index)
  availability_zone       = var.azs[count.index]
  map_public_ip_on_launch = true
}

resource "aws_subnet" "private" {
  count             = 2
  vpc_id            = aws_vpc.main.id
  cidr_block        = cidrsubnet(var.vpc_cidr, 8, count.index + 2)
  availability_zone = var.azs[count.index]
}

resource "aws_route_table_association" "public_subnet_0" {
  subnet_id      = aws_subnet.public[0].id
  route_table_id = aws_route_table.public.id
}

resource "aws_route_table_association" "public_subnet_1" {
  subnet_id      = aws_subnet.public[1].id
  route_table_id = aws_route_table.public.id
}
resource "aws_internet_gateway" "gw" {
  vpc_id = "vpc-0e366c022779ea77d"
}
resource "aws_route_table" "public" {
  vpc_id = "vpc-0e366c022779ea77d"

  tags = {
    Name = "public-route-table"
  }
}
resource "aws_route" "internet_access" {
  route_table_id         = aws_route_table.public.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.gw.id
}

