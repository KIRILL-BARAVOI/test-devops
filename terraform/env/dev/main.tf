provider "google" {
  project = var.project_id
  region  = var.region
}

# terraform {
#   backend "gcs" {
#     bucket = "test-devops-tftstate-bucket"
#     prefix = "terraform/dev"
#   }
# }

module "storage" {
  source   = "../../modules/storage"
  project_id  = var.project_id
  tfstate_bucket_name     = var.tfstate_bucket_name
  location = var.location
}

module "vpc" {
  source     = "../../modules/network"
  project_id = var.project_id
  region     = var.region

  network_name = var.network_name
  subnet_name  = var.subnet_name
  subnet_ip    = var.subnet_ip
}

module "gce" {
  source     = "../../modules/vm"
  project_id = var.project_id
  env        = var.env
  region     = var.region
  zone       = var.zone

  instance_name  = var.instance_name
  instance_image = var.instance_image
  instance_type  = var.instance_type
  instance_tags  = var.instance_tags
  instance_label = var.instance_label

  depends_on   = [module.vpc]
  network_name = var.network_name
  subnet_name  = var.subnet_name
}

module "firewall" {
  source       = "../../modules/firewall"
  project_id   = var.project_id
  network_name = var.network_name
  instance_tags  = var.instance_tags

  depends_on = [module.vpc]
}

# module "iam" {
#   source            = "../../modules/iam"
#   project_id        = var.project_id
#   iap_to_ssh_groups = var.iap_to_ssh_groups
# }
