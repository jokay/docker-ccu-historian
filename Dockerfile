ARG VERSION=2.5.3
ARG CHECKSUM=0ce08e96b52ba7ac1e6812bcac105a18191542bc1f8816287364587edd49b48fac9196e24ab6cb9bebfbe584395bf53c5155f33ab91a24c64d8054e150db3d82

FROM docker.io/alpine:3.13.0 AS build

ARG VERSION
ARG CHECKSUM

WORKDIR /tmp

ADD https://github.com/mdzio/ccu-historian/releases/download/${VERSION}/ccu-historian-${VERSION}-bin.zip .

# hadolint ignore=DL4006
RUN printf "%s  ccu-historian-%s-bin.zip" "${CHECKSUM}" "${VERSION}" | sha512sum -c - && \
    mkdir /tmp/ccu-historian && \
    unzip ccu-historian-${VERSION}-bin.zip -d /tmp/ccu-historian

FROM docker.io/adoptopenjdk:11.0.9.1_1-jre-hotspot

ARG VERSION

ENV VERSION ${VERSION}

ENV TZ UTC

WORKDIR /opt/ccu-historian

RUN mkdir -p /database && \
    printf "%s" "${TZ}" > /etc/timezone

COPY --from=build /tmp/ccu-historian /opt/ccu-historian

VOLUME ["/opt/ccu-historian/config", "/database"]

COPY docker-entrypoint.sh /usr/local/bin/
ENTRYPOINT ["docker-entrypoint.sh"]

EXPOSE 80 2098 2099 8082 9092 5435

HEALTHCHECK --interval=1m --timeout=3s \
    CMD curl -f http://localhost/historian || exit 1