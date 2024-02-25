#!/bin/bash

# Iterate over all arguments
for ip in "$@"; do
  # Append each IP address to the database's firewall
  doctl databases firewalls append $DATABASE_ID --rule ip_addr:$ip
done
