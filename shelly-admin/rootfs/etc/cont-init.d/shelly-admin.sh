#!/usr/bin/with-contenv bashio
# ==============================================================================
# Home Assistant Add-on: Shelly-Admin
# Configures Shelly-Admin before running
# ==============================================================================
declare port

# Pass in port & SSL settings
port=$(bashio::addon.port 80)
sed -i "s/3000/${port:-80}/" "/shelly-admin/bin/www"
if ! bashio::var.has_value "${port}"; then
    bashio::log.warning
    bashio::log.warning "Direct access mode is disabled, Shelly Admin"
    bashio::log.warning "will not work!"
    bashio::log.warning
    bashio::log.warning "Please assign a port in the Network section of this"
    bashio::log.warning "add-on configuration."
    bashio::log.warning
fi
