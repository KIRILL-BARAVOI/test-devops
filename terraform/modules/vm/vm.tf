data "template_file" "startup-script" {
  template = file("${path.module}/${var.install_script_src_path}")

  vars = {
    env = var.env
  }
}

resource "google_compute_instance" "test-devops" {
  project      = var.project_id
  zone         = var.zone
  name         = var.instance_name
  machine_type = var.instance_type
  labels       = var.instance_label
  tags         = var.instance_tags

  boot_disk {
    initialize_params {
      image = var.instance_image
    }
  }

  network_interface {
    network    = var.network_name
    subnetwork = var.subnet_name
  }

  metadata_startup_script = data.template_file.startup-script.rendered
}