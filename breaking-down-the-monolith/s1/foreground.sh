#!/bin/bash

# Try making the home ASAP so the editor can catch it
if [ ! -d /ecommerce-observability ]; then
  mkdir /ecommerce-observability
fi

# Wait for the background to run
while true; do
  sleep 1
  if sudo grep -i "COMPOSE_FILE" /root/.bashrc; then
    source ~/.bashrc
    break
  fi
done

clear

echo "Your environment is ready to go!"
