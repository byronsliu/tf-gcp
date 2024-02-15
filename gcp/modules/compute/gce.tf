
variable  "my-network" {}
variable  "project_id" {}
variable  "region" {}
variable  "instance_name" {}
variable  "machine_type" {}


# Compute Instance
resource "google_compute_instance" "my_instance" {
  name         = var.instance_name
  machine_type = var.machine_type
  zone         = "${var.region}-b"
  project      = var.project_id

  allow_stopping_for_update = true
  tags                      = ["stage", "dev"]

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
      labels = {
        my_label = "volume-1"
      }
    }
  }

  // Local SSD disk
  scratch_disk {
    interface = "NVME"
  }

  network_interface {
    network    = "default"
  #  network    = var.my-network
  #  subnetwork = "${var.my-network}-public-subnet"
  }
}
