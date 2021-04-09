ARG BUILD_FROM=ghcr.io/hassio-addons/base/amd64:9.1.7
# hadolint ignore=DL3006
FROM ${BUILD_FROM}

ENV LANG C.UTF-8

# Set shell
SHELL ["/bin/bash", "-o", "pipefail", "-c"]

# Copy root filesystem
COPY rootfs /
WORKDIR /shelly-admin

# Setup base system
ARG BUILD_ARCH=amd64

# Build arguments
ARG BUILD_DATE
ARG BUILD_DESCRIPTION
ARG BUILD_NAME
ARG BUILD_REF
ARG BUILD_REPOSITORY
ARG BUILD_VERSION

RUN \
    apk add --no-cache \
    curl \
    nginx \
    patch \
    nodejs \
    npm

RUN \
    if [ "${BUILD_ARCH}" = "aarch64" ]; then ARCH="arm64"; fi \
    && if [ "${BUILD_ARCH}" = "armhf" ]; then ARCH="arm"; fi \
    && if [ "${BUILD_ARCH}" = "armv7" ]; then ARCH="arm"; fi \
    && if [ "${BUILD_ARCH}" = "amd64" ]; then ARCH="amd64"; fi \
    \
    && curl -L -s "https://github.com/maxlyth/shelly-admin-express/archive/refs/tags/${BUILD_VERSION}.tar.gz" | tar zxvf - -C /shelly-admin --strip-components=1 \
    \
    && npm config set unsafe-perm true \
    \
    && npm install \
    --no-audit \
    --no-optional \
    --no-update-notifier \
    --only=production \
    --unsafe-perm \
    \
    && npm cache clear --force \
    && rm -fr \
    /tmp/* \
    /etc/nginx


EXPOSE 5683/udp 5683/tcp 3000/tcp

# Labels
LABEL \
    io.hass.name="${BUILD_NAME}" \
    io.hass.description="${BUILD_DESCRIPTION}" \
    io.hass.arch="${BUILD_ARCH}" \
    io.hass.type="addon" \
    io.hass.version=${BUILD_VERSION} \
    maintainer="Max Lyth <maxlyth@gmail.com>" \
    org.opencontainers.image.title="${BUILD_NAME}" \
    org.opencontainers.image.description="${BUILD_DESCRIPTION}" \
    org.opencontainers.image.vendor="Hass.io Repository by maxlyth" \
    org.opencontainers.image.authors="Max Lyth <maxlyth@gmail.com>" \
    org.opencontainers.image.licenses="MIT" \
    org.opencontainers.image.url="https://github.com/maxlyth/hassio-addons" \
    org.opencontainers.image.source="https://github.com/${BUILD_REPOSITORY}" \
    org.opencontainers.image.documentation="https://github.com/${BUILD_REPOSITORY}/blob/main/README.md" \
    org.opencontainers.image.created=${BUILD_DATE} \
    org.opencontainers.image.revision=${BUILD_REF} \
    org.opencontainers.image.version=${BUILD_VERSION}
