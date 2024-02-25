output "droplet_ip" {
  value = digitalocean_droplet.brightlyst.ipv4_address
}

output "mysql_cluster_host" {
  value = digitalocean_database_cluster.brightlyst_mysql.host
}

output "mysql_cluster_name" {
  value = "brightlyst-mysql-cluster"
}

output "mysql_cluster_port" {
  value = digitalocean_database_cluster.brightlyst_mysql.port
}

output "mysql_cluster_user" {
  value = digitalocean_database_cluster.brightlyst_mysql.user
}

output "mysql_cluster_password" {
  value     = digitalocean_database_cluster.brightlyst_mysql.password
  sensitive = true
}

output "mysql_cluster_uri" {
  value     = digitalocean_database_cluster.brightlyst_mysql.uri
  sensitive = true
}
