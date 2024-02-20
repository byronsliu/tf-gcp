
variable "child_vpc_parms" {
  type = object ({
    project_id       = string
    region           = string
    zone             = string
    network_name     = string
    delete_default_routes_on_create     = bool
    auto_create_subnetworks            = bool
    routing_mode     = string
    private_ip_google_access = bool
    subnets             = map(string)
  })
}

data "google_compute_zones" "my_region" {
  region  = var.child_vpc_parms.region
  project = var.child_vpc_parms.project_id
}

# VPC
resource "google_compute_network" "my-network" {
  name                            = var.child_vpc_parms.network_name
  project                         = var.child_vpc_parms.project_id
  delete_default_routes_on_create = var.child_vpc_parms.delete_default_routes_on_create
  auto_create_subnetworks         = var.child_vpc_parms.auto_create_subnetworks
  routing_mode                    = var.child_vpc_parms.routing_mode
}


# SUBNETS
resource "google_compute_subnetwork" "public-subnet" {
  for_each = var.child_vpc_parms.subnets
  name                     = each.key
  ip_cidr_range            = each.value
  region                   = var.child_vpc_parms.region
  project                  = var.child_vpc_parms.project_id
  network                  = google_compute_network.my-network.id
  private_ip_google_access = var.child_vpc_parms.private_ip_google_access
}

