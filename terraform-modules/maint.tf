module y-module {
  source = "./modules/y-module"

  region_name             = "us-east-1"
  vm_instance_type        = "t3.micro"
  network_cidr            = "172.16.0.0/16"
  number_of_zones_to_span = 3
  common_tags             = { "team" = "y" }
  network_name            = "network-team-y"
}