output vpc_id_output {
  description = "Unique id of the vpc"
  value       = aws_vpc.vpc.id
}

output subnet {
  description = "Id of the first subnet"
  value = aws_subnet.public_web_subnets.0.id
}