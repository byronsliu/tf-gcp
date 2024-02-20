module "myvpc" {
  source          = "./modules/network"
  child_vpc_parms = var.vpc_parms

}

module "mygce" {
  source          = "./modules/compute"
  child_gce_parms = var.gce_parms
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

