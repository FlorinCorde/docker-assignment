locals {
  igw_name = "igw-${var.region_name}-${var.network_name}"
}

resource aws_internet_gateway internet_gateway {
  vpc_id = aws_vpc.vpc.id
  tags   = merge({ Name = local.igw_name }, local.module_common_tags)
}
resource aws_route igw {
  route_table_id         = aws_route_table.public.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.internet_gateway.id
}
