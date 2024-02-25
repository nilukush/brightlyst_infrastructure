variable "do_token" {
  description = "The DigitalOcean Personal Access Token."
  type        = string
}

variable "region" {
  description = "The DigitalOcean region for deploying resources."
  type        = string
}

variable "image" {
  description = "The image slug for the Droplet."
  type        = string
}

variable "size" {
  description = "The size of the DigitalOcean Droplet."
  type        = string
}

variable "ssh_fingerprint" {
  description = "The fingerprint of the SSH key."
  type        = string
}

variable "droplet_name" {
  description = "The name for the DigitalOcean Droplet."
  type        = string
}

variable "mysql_password" {
  description = "The password for the MySQL user"
  type        = string
  sensitive   = true
}
