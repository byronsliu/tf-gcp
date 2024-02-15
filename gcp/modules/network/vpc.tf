
variable "region" {}
variable "project_id" {}
variable "network_name" {}
variable "ip_cidr_range_1" {}


data "google_compute_zones" "my_region" {
  region  = var.region
  project = var.project_id
}

locals {
  type  = ["public", "private"]
  zones = data.google_compute_zones.my_region.names
}

# VPC
resource "google_compute_network" "my-network" {
  name                            = var.network_name
  project                         = var.project_id
  delete_default_routes_on_create = false
  auto_create_subnetworks         = false
  routing_mode                    = "REGIONAL"
}

# SUBNETS
resource "google_compute_subnetwork" "public-subnet" {
#  count                    = 2
  name                     = "${var.network_name}-public-subnet"
  ip_cidr_range            = var.ip_cidr_range_1
  region                   = var.region
  project                  = var.project_id
  network                  = google_compute_network.my-network.id
  private_ip_google_access = true
}
