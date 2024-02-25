resource "null_resource" "create_mysql_table_brightlyst_linkedin" {
  depends_on = [
    mysql_database.brightlyst_db,
  ]

  provisioner "local-exec" {
    command = <<EOT
    mysql --host=${digitalocean_database_cluster.brightlyst_mysql.host} --port=25060 --user=doadmin --password='${var.mysql_password}' --ssl-ca=${path.module}/ca-certificate.crt -e "USE brightlyst; CREATE TABLE IF NOT EXISTS brightlyst_linkedin (id INT AUTO_INCREMENT PRIMARY KEY, title_job VARCHAR(255), url_image VARCHAR(255), url_original VARCHAR(255), url_company VARCHAR(255), company VARCHAR(255), location VARCHAR(255), time_of_posting VARCHAR(255));"
    EOT
  }
}
