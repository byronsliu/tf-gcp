
variable "child_gce_parms" {
  type = object ({
  project_id = string
  region = string
  zone = string
  instance_name = string
  machine_type = string
  image = string
  scratch_disk = string
  network_name = string
  provisioned_iops = number
  tags = list(string)
  })
}


# Compute Instance
resource "google_compute_instance" "my_instance" {
  name         = var.child_gce_parms.instance_name
  machine_type = var.child_gce_parms.machine_type
  zone         = var.child_gce_parms.zone
  project      = var.child_gce_parms.project_id

  tags   = var.child_gce_parms.tags

  boot_disk {
    initialize_params {
      image = var.child_gce_parms.image
      provisioned_iops = var.child_gce_parms.provisioned_iops
      }
    }

  // Local SSD disk
  scratch_disk {
    interface = var.child_gce_parms.scratch_disk
  }

  network_interface {
    network    = var.child_gce_parms.network_name
  }
}
