variable "project_id" {
  default     = ""
  description = "project_id"
}

variable "region" {
  default     = ""
  description = "region"
}

variable "env" {
  description = "environment for service"
}

variable "instance_name" {}
variable "instance_image" {}
variable "instance_type" {}
variable "instance_tags" {}
variable "instance_label" {}

variable "install_script_src_path" {
  description = "Path to install script within this repository"
  default     = "templates/startupsh.tpl"
}

variable "network_name" {}
variable "subnet_name" {}
variable "subnet_ip" {}
