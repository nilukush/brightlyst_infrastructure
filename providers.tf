provider "digitalocean" {
  token = var.do_token
}

provider "mysql" {
  endpoint = "brightlyst-mysql-cluster-do-user-15915816-0.c.db.ondigitalocean.com:25060"
  username = "doadmin"
  password = var.mysql_password # It's recommended to use variables for sensitive data
  # Since you're connecting to DigitalOcean's managed database, you might also need to specify TLS configurations.
}
