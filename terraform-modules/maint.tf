module y-module {
  source = "./modules/y-module"

  region_name             = "us-east-1"
  network_cidr            = "172.16.0.0/16"
  number_of_zones_to_span = 3
  common_tags             = { "team" = "y" }
  network_name            = "network-team-y"
}

module y-machines {
  source = "./modules/y-machines"
  region_name             = "us-east-1"
  vm_instance_type        = "t3.micro"
  common_tags             = { "team" = "y" }
  subnet_id = module.y-module.subnet
}