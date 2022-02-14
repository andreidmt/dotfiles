#!/bin/sh

# Exit script if any statement returns a non-true return value
set -e

# Exit script if trying to use an uninitialised variable
set -u

#
# List all available droplets ("doctl auth init" before)
#

query="map({\
  id,\
  name,\
  ip_public: .networks.v4 | map(select(.type == \"public\"))[0] | .ip_address,\
  status,\
  price:.size.price_monthly\
})"

doctl compute droplet list -o json | jq "$query" 
