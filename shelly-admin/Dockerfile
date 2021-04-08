ARG BUILD_FROM=ghcr.io/hassio-addons/base/amd64:9.0.1
# hadolint ignore=DL3006
FROM ${BUILD_FROM}

# Setup base
ARG BUILD_ARCH=amd64

RUN apk add --no-cache curl nodejs npm

# Copy root filesystem
COPY rootfs /

RUN \
    if [ "${BUILD_ARCH}" = "aarch64" ]; then ARCH="arm64"; fi \
    && if [ "${BUILD_ARCH}" = "armhf" ]; then ARCH="arm"; fi \
    && if [ "${BUILD_ARCH}" = "armv7" ]; then ARCH="arm"; fi \
    && if [ "${BUILD_ARCH}" = "amd64" ]; then ARCH="amd64"; fi \
    \
    && mkdir -p /shelly-admin \
    && curl -L -s "https://github.com/maxlyth/shelly-admin-express/archive/refs/tags/0.1.0.tar.gz" | tar zxvf - -C /shelly-admin --strip-components=1

WORKDIR /shelly-admin

RUN npm install

EXPOSE 5683/udp 5683/tcp 3000/tcp

# Copy data for add-on
RUN chmod a+x /run.sh

CMD [ "/run.sh" ]
