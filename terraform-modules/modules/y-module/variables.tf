variable region_name {
  description = "Name of the aws region"
  type        = string
}

variable common_tags {
  type        = map(string)
  description = "Common tags"
}

variable network_cidr {
  type        = string
  description = "Network CIDR"
}

variable network_name {
  description = "Network name"
  type        = string
}

variable number_of_zones_to_span {
  type        = number
  description = "Number of zones to span"
}

variable vm_instance_type {
  type        = string
  description = "Virtual Machine Instance Type"
}

#variable vm_root_volume_size {
#  type        = number
#  description = "Virtual Machine Root Volume size"
#}
#
#variable vm_root_volume_type {
#  type        = string
#  description = "Virtual Machine Root Volume type"
#}

