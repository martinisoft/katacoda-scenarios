#!/bin/bash

# Make a new home and clone the app
if [ ! -d /root/ecommerce-observability ]; then
  mkdir /root/ecommerce-observability
fi
git clone https://github.com/DataDog/ecommerce-workshop /root/ecommerce-observability && cd /root/ecommerce-observability

# Stop instrumenting the ads/discounts services
sudo sed -i 's/ddtrace-run //g' /root/ecommerce-observability/docker-compose-files/docker-compose-fixed-instrumented.yml

# Some special env vars
{
  echo "export POSTGRES_USER=postgres"
  echo "export POSTGRES_PASSWORD=postgres"
  echo "export COMPOSE_FILE=/root/ecommerce-observability/docker-compose-files/docker-compose-fixed-instrumented.yml"
} >> ~/.bashrc

# Utility commands to manage the cluster
{
  echo "alias application_start='docker-compose up'"
  echo "alias application_stop='docker-compose stop && docker-compose rm -f'"
  echo "alias application_reload='application_stop && application_start'"
  echo "alias generate_traffic='/root/ecommerce-observability/gor --input-file-loop --input-file /root/ecommerce-observability/requests_0.gor --output-http \"http://localhost:3000\"'"
  echo "alias sales_deploy='docker-compose kill discounts'"
  echo "alias rollback_deploy='docker-compose up discounts'"
} >> ~/.bashrc
