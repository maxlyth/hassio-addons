#!/usr/bin/with-contenv bashio
# ==============================================================================
# Home Assistant  Add-on: Shelly-Admin
# Starts Shelly-Admin
# ==============================================================================
declare port
declare host
declare prefix

# Pass in port, host and URL settings
bashio::log.info $(bashio::addon.ingress_port)
bashio::log.info $(bashio::addon.ingress_url)
bashio::log.info $(bashio::addon.ip_address)
bashio::log.info $(bashio::addon.network)

port=$(bashio::addon.ingress_port)
host="0.0.0.0"
prefix=""

export NODE_PATH=/shelly-admin/node_modules

cd /shelly-admin || bashio::exit.nok "Could not change directory to Shelly Admin"

cat >.env <<EOL
HOST=${host}
PORT=${port}
PREFIX=${prefix}
TRUSTPROXY=loopback, 172.30.32.1
UIMODE=light
EOL

bashio::log.info "Starting Shelly-Admin..."
exec npm start
