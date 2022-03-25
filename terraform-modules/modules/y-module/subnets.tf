locals {
  subnet_cidrs              = cidrsubnets(aws_vpc.vpc.cidr_block, 8, 8, 8, 4, 4, 4, 4, 4, 4)
  public_web_subnet_cidrs   = slice(local.subnet_cidrs, 0, 3)
  private_app_subnet_cidrs  = slice(local.subnet_cidrs, 3, 6)
  private_data_subnet_cidrs = slice(local.subnet_cidrs, 6, 9)
  names_of_zones_to_span    = slice(data.aws_availability_zones.zones.names, 0, var.number_of_zones_to_span)
  subnet_name_prefixes      = [for zone in local.names_of_zones_to_span : "sn-${zone}-${var.network_name}"]
}
resource aws_subnet public_web_subnets {
  count                   = var.number_of_zones_to_span
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = local.public_web_subnet_cidrs[count.index]
  availability_zone       = data.aws_availability_zones.zones.names[count.index]
  map_public_ip_on_launch = true
  tags                    = merge({
    Name = "${local.subnet_name_prefixes[count.index]}-web"
  }, local.module_common_tags)
}

resource aws_subnet private_app_subnets {
  count                   = var.number_of_zones_to_span
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = local.private_app_subnet_cidrs[count.index]
  availability_zone       = data.aws_availability_zones.zones.names[count.index]
  map_public_ip_on_launch = false
  tags                    = merge({
    Name = "${local.subnet_name_prefixes[count.index]}-app"
  }, local.module_common_tags)
}

resource aws_subnet private_data_subnets {
  count                   = var.number_of_zones_to_span
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = local.private_data_subnet_cidrs[count.index]
  availability_zone       = data.aws_availability_zones.zones.names[count.index]
  map_public_ip_on_launch = false
  tags                    = merge({
    Name = "${local.subnet_name_prefixes[count.index]}-data"
  }, local.module_common_tags)
}

