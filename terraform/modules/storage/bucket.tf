resource "google_storage_bucket" "tfstate-bucket" {
  project  = var.project_id
  name     = var.tfstate_bucket_name
  location = var.location
  versioning {
    enabled = true
  }
}