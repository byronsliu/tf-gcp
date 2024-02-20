
vpc_parms = {
  project_id                      = "learning1-381804"
  region                          = "us-east1"
  zone                            = "us-east1-b"
  network_name                    = "webvpc"
  delete_default_routes_on_create = false
  auto_create_subnetworks         = false
  routing_mode                    = "REGIONAL"
  private_ip_google_access        = true
  #subnets                         = ["10.10.10.0/24", "10.10.20.0/24", "10.10.30.0/28"]
  subnets = { "subnet1" = "10.10.10.0/24", "subnet2" = "10.10.20.0/24", "subnet3" = "10.10.30.0/28", }

}