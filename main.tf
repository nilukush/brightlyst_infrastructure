resource "digitalocean_droplet" "brightlyst" {
  name   = var.droplet_name
  region = var.region
  size   = var.size
  image  = var.image
  ssh_keys = [
    var.ssh_fingerprint
  ]
}

resource "digitalocean_vpc" "brightlyst_vpc" {
  name     = "brightlyst-vpc"
  region   = var.region
  ip_range = "10.10.10.0/24"
}

resource "digitalocean_database_cluster" "brightlyst_mysql" {
  name       = "brightlyst-mysql-cluster"
  engine     = "mysql"
  version    = "8"
  size       = "db-s-1vcpu-1gb"
  region     = var.region
  node_count = 1
}

resource "null_resource" "update_firewall" {
  triggers = {
    update_trigger = timestamp()
  }

  provisioner "local-exec" {
    # Pass IP addresses as separate arguments
    command = "sh ${path.module}/update_firewall.sh 5.194.212.57"
    environment = {
      DATABASE_ID               = digitalocean_database_cluster.brightlyst_mysql.id
      DIGITALOCEAN_ACCESS_TOKEN = var.do_token
    }
  }
}
