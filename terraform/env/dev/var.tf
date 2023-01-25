variable "project_id" {
  default     = ""
  description = "project id"
}

variable "region" {
  default     = ""
  description = "region"
}

variable "zone" {
  default     = ""
  description = "zone"
}

variable "env" {
  description = "environment for service"
}

variable "tfstate_bucket_name" {}
variable "location" {}
variable "network_name" {}
variable "subnet_name" {}
variable "subnet_ip " {}
variable "instance_name" {}
variable "instance_image" {}
variable "instance_type" {}
variable "instance_tags" {}

variable "instance_label" {
  type        = map(string)
  description = "instance label"
  default     = { for_project = "test_devops", resource = "vm_instance", os = "debian", os_version = "9" }
}

variable "var.iap_to_ssh_groups" {
  type    = set(string)
  default = []
}
