#!/usr/bin/with-contenv bashio
# ==============================================================================
# Home Assistant Add-on: Shelly-Admin
# Configures NGINX for use with Shelly-Admin
# ==============================================================================
#declare admin_port
#
## Generate Ingress configuration
#bashio::var.json \
#interface "$(bashio::addon.ip_address)" \
#port "^$(bashio::addon.ingress_port)" \
#| tempio \
#-template /etc/nginx/templates/ingress.gtpl \
#-out /etc/nginx/servers/ingress.conf
#
## Generate direct access configuration, if enabled.
#admin_port=$(bashio::addon.port 43813)
#if bashio::var.has_value "${admin_port}"; then
#    bashio::config.require.ssl
#    bashio::var.json \
#    certfile "$(bashio::config 'certfile')" \
#    keyfile "$(bashio::config 'keyfile')" \
#    port "^${admin_port}" \
#    ssl "^$(bashio::config 'ssl')" \
#    | tempio \
#    -template /etc/nginx/templates/direct.gtpl \
#    -out /etc/nginx/servers/direct.conf
#fi
