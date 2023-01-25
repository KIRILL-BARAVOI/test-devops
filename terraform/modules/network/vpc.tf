module "test-vpc-module" {
  source       = "terraform-google-modules/network/google"
  version      = "~> 6.0"
  project_id   = var.project_id
  network_name = var.network_name
  mtu          = 1460

  subnets = [
    {
      subnet_name   = var.subnet_name
      subnet_ip     = var.subnet_ip
      subnet_region = var.region
    }
  ]
}
