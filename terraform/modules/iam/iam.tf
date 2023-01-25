resource "google_project_iam_member" "iap_to_ssh_users" {
  for_each = toset(var.iap_to_ssh_groups)
  project  = local.project.project_id
  role     = "roles/iap.tunnelResourceAccessor"
  member   = each.key
}
