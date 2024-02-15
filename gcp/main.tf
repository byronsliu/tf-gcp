module "myvpc" {
  source          = "./modules/network"
  region          = var.region
  project_id      = var.project_id
  network_name    = var.network_name
  ip_cidr_range_1 = var.ip_cidr_range_1
}

module "mygce" {
  source     = "./modules/compute"
  region     = var.region
  my-network = var.network_name
  project_id = var.project_id
  machine_type = "n2-standard-2"
  instance_name = "webserver1"
}

terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = ">4.51.0"
    }
  }
}

provider "google" {
  credentials = file("learning1-381804-54e7eb4ae9d4.json")
}

