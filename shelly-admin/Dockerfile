ARG BUILD_FROM=ghcr.io/hassio-addons/base/amd64:9.0.1
# hadolint ignore=DL3006
FROM ${BUILD_FROM}

# Set shell
SHELL ["/bin/bash", "-o", "pipefail", "-c"]

# Setup base
ARG BUILD_ARCH=amd64
RUN \
    if [ "${BUILD_ARCH}" = "aarch64" ]; then ARCH="arm64"; fi \
    && if [ "${BUILD_ARCH}" = "armhf" ]; then ARCH="arm"; fi \
    && if [ "${BUILD_ARCH}" = "armv7" ]; then ARCH="arm"; fi \
    && if [ "${BUILD_ARCH}" = "amd64" ]; then ARCH="amd64"; fi \
    \
    && curl -L -s \
        "https://github.com/maxlyth/shelly-admin-express/releases/download/0.1.0/shelly-admin-0.1.0-linux-${ARCH}.tar.gz" \
        | tar zxvf - -C /shelly-admin/

RUN apk add --no-cache nodejs npm
WORKDIR /room-assistant

# Copy root filesystem
COPY rootfs /
RUN npm install


CMD ["/room-assistant/entrypoint.sh"]
