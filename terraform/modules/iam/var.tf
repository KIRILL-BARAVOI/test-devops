variable "project_id" {
  default     = ""
  description = "project_id"
}

variable "var.iap_to_ssh_groups" {
  type    = list(string)
  default = []
}