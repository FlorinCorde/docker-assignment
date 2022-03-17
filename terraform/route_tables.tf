resource aws_route_table public {
  vpc_id = aws_vpc.vpc.id
  tags   = merge({
    "Name" = "rtb-${var.region_name}-${var.network_name}-igw"
  }, local.module_common_tags)
}

resource aws_route_table_association public_web {
  count          = length(aws_subnet.public_web_subnets)
  subnet_id      = aws_subnet.public_web_subnets[count.index].id
  route_table_id = aws_route_table.public.id
}
