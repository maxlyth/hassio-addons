
ARG BUILD_FROM

FROM $BUILD_FROM as build
ARG BUILD_VERSION=latest

RUN apk add --no-cache nodejs npm python3 make g++ linux-headers
RUN npm install -g --unsafe-perm shelly-admin@$BUILD_VERSION

FROM $BUILD_FROM

WORKDIR /shelly-admin
ENV LANG C.UTF-8

RUN apk add --no-cache nodejs npm \
    && mkdir -p /shelly-admin/config \
    && ln -s /usr/lib/node_modules/shelly-admin/bin/shelly-admin.js /usr/bin/shelly-admin

COPY rootfs /
COPY --from=build /usr/lib/node_modules/shelly-admin /usr/lib/node_modules/shelly-admin

CMD ["/shelly-admin/entrypoint.sh"]
