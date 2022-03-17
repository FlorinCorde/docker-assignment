resource aws_vpc vpc {
  cidr_block = var.network_cidr
  enable_dns_hostnames = true
  enable_dns_support = true
  tags = merge({ Name = var.network_name }, local.module_common_tags)
}