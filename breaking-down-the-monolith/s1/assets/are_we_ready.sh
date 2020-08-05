#!/bin/bash

# Cool spinner thing
are_we_ready()
{
  echo -n "Starting"
  local -r delay='0.75'
  local spinstr='\|/-'
  local temp
  while true; do
    if [[ -f /ecommerce-observability/docker-compose-files/docker-compose-fixed-instrumented.yml ]]; then
      temp="${spinstr#?}"
      printf " [%c]  " "${spinstr}"
      spinstr=${temp}${spinstr%"${temp}"}
      sleep "${delay}"
      printf "\b\b\b\b\b\b"
    else
      break
    fi
  done
  printf "    \b\b\b\b"
  echo ""
  echo "Started"
  echo -n "Configuring"
  # Stop instrumenting the ads/discounts services
  sed -i 's/ddtrace-run //g' /ecommerce-observability/docker-compose-files/docker-compose-fixed-instrumented.yml
  echo "You are ready to go!"
}

are_we_ready