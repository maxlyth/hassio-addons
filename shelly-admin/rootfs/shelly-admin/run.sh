#!/usr/bin/with-contenv bashio
# ==============================================================================
# Home Assistant  Add-on: Shelly-Admin
# Starts Shelly-Admin
# ==============================================================================
declare port
# Pass in port & SSL settings
port=$(bashio::addon.ingress_port)
sed -i "s/43812/${port}/" "/shelly-admin/bin/www"

export NODE_PATH=/shelly-admin/node_modules

cd /shelly-admin || bashio::exit.nok "Could not change directory to Shelly Admin"

bashio::log.info "Starting Shelly-Admin..."
exec npm start ${port}
