# Create IAP SSH permissions
resource "google_compute_firewall" "iap_to_ssh" {
  name    = "ingress-allow-iap-to-ssh"
  network = var.network_name

  direction = "INGRESS"
  priority  = 1000

  source_ranges = ["35.235.240.0/20"]
  target_tags   = var.instance_tags

  allow {
    protocol = "tcp"
    ports    = [22]
  }
}
