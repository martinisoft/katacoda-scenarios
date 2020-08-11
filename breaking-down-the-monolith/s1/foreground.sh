#!/bin/bash

# Try making the home ASAP so the editor can catch it
if [ ! -d /root/ecommerce-observability ]; then
  mkdir /root/ecommerce-observability
fi

# Wait for the background to run
while true; do
  sleep 1
  if sudo grep -i "COMPOSE_FILE" /root/.bashrc; then
    source /root/.bashrc
    break
  fi
done

clear

echo "Your environment is ready to go!"
