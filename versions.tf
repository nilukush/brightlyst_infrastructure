terraform {
  required_version = ">= 0.14"

  required_providers {
    digitalocean = {
      source  = "digitalocean/digitalocean"
      version = "~> 2.0"
    }
    mysql = {
      source  = "petoju/mysql"
      version = "3.0.48"
    }
  }
}
