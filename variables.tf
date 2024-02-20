
variable "gce_parms" {
  type = object({
    project_id       = string
    region           = string
    zone             = string
    instance_name    = string
    machine_type     = string
    image            = string
    scratch_disk     = string
    network_name     = string
    provisioned_iops = number
    tags             = list(string)
  })
}

variable "vpc_parms" {
  type = object({
    project_id                      = string
    region                          = string
    zone                            = string
    network_name                    = string
    delete_default_routes_on_create = bool
    auto_create_subnetworks         = bool
    routing_mode                    = string
    private_ip_google_access        = bool
    subnets                         = map(string)
  })
}
