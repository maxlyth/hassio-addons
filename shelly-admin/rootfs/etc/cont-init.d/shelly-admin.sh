#!/usr/bin/with-contenv bashio
# ==============================================================================
# Home Assistant Add-on: Shelly-Admin
# Configures Shelly-Admin before running
# ==============================================================================
declare port

# Pass in port & SSL settings
port=$(bashio::addon.port 43812)
sed -i "s/43812/${port}/" "/shelly-admin/bin/www"

if bashio::config.true 'ssl'; then
    #    sed -i "s/%%SSL%%/true/" "/shelly-admin/bin/www"
    bashio::log.warning
    bashio::log.warning "Direct access to Shelly Admin via SSL is not yet available!"
    bashio::log.warning
    bashio::log.warning "Please remove the port assignment and allow Home Assistant"
    bashio::log.warning "to handle ingress."
    bashio::log.warning
else
    #    sed -i "s/%%SSL%%/false/" "/shelly-admin/bin/www"
fi