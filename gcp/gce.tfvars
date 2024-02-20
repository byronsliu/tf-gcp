
gce_parms = {
  project_id       = "learning1-381804"
  region           = "us-east1"
  zone             = "us-east1-b"
  instance_name    = "webserver1"
  machine_type     = "n1-standard-1"
  disk_size_gb     = 20
  image            = "debian-cloud/debian-10"
  scratch_disk     = "NVME"
  network_name     = "default"
  provisioned_iops = 40000
  tags             = ["Dev", "Web"]
}
