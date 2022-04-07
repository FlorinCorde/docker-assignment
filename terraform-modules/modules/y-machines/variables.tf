variable region_name {
  description = "Name of the aws region"
  type        = string
}

variable subnet_id {
  description = "Id of the subnet"
}

variable vm_instance_type {
  type        = string
  description = "Virtual Machine Instance Type"
}

variable common_tags {
  type        = map(string)
  description = "Common tags"
}
