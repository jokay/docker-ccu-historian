ARG VERSION=2.8.0
ARG CHECKSUM=51e9d9dbb8cb987e8f2f7bbbd889030c3e4e3e702c50ca80d778d87f58818f078c3393e6f4123920c771f8968752b4ba60660937a8b7c778ee165cb0b7b0749e

FROM docker.io/alpine:3.15.0@sha256:21a3deaa0d32a8057914f36584b5288d2e5ecc984380bc0118285c70fa8c9300 AS build

ARG VERSION
ARG CHECKSUM

WORKDIR /tmp

ADD https://github.com/mdzio/ccu-historian/releases/download/${VERSION}/ccu-historian-${VERSION}-bin.zip .

# hadolint ignore=DL4006
RUN printf "%s  ccu-historian-%s-bin.zip" "${CHECKSUM}" "${VERSION}" | sha512sum -c - && \
    mkdir /tmp/ccu-historian && \
    unzip "ccu-historian-${VERSION}-bin.zip" -d /tmp/ccu-historian

FROM docker.io/eclipse-temurin:11.0.13_8-jre-focal@sha256:863a0ce9bd62162213120677aa1a521b1d847e5c6cd3b53abf2d01d6add394b5

ARG VERSION

ENV VERSION "${VERSION}"
ENV TZ "UTC"

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