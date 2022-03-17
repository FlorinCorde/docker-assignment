variable region_name {
  description = "Name of the aws region"
  type = string
}

variable common_tags {
  type = map(string)
}

variable network_cidr {

}

variable network_name {
  description = "Network name"
  type = string
}