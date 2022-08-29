ARG VERSION=3.2.0
ARG CHECKSUM=2b364deb12da42cec073b2edcf70be321d609392b9b2599cca0c2cdf5372335f4d237dc726861ad91305c3d3d83a2a27fc4d1ab3b07a66e88a4ac2c33abd2cbc

# https://hub.docker.com/_/alpine
FROM docker.io/alpine:3.16.2@sha256:bc41182d7ef5ffc53a40b044e725193bc10142a1243f395ee852a8d9730fc2ad AS build

ARG VERSION
ARG CHECKSUM

WORKDIR /tmp

ADD https://github.com/mdzio/ccu-historian/releases/download/${VERSION}/ccu-historian-${VERSION}-bin.zip .

# hadolint ignore=DL4006
RUN printf "%s  ccu-historian-%s-bin.zip" "${CHECKSUM}" "${VERSION}" | sha512sum -c - && \
    mkdir /tmp/ccu-historian && \
    unzip "ccu-historian-${VERSION}-bin.zip" -d /tmp/ccu-historian

# https://hub.docker.com/_/eclipse-temurin
FROM docker.io/eclipse-temurin:18.0.2_9-jre-focal@sha256:b6fd561838bc3b55bc8d6e4801a28af02bdb40d9b066ee93eb2f0e29e1eee6d4

ARG VERSION

ENV VERSION "${VERSION}"
ENV TZ "UTC"

WORKDIR /opt/ccu-historian

RUN mkdir -p /database && \
    printf "%s" "${TZ}" > /etc/timezone

COPY --from=build /tmp/ccu-historian /opt/ccu-historian

VOLUME ["/opt/ccu-historian/config", "/database"]

COPY entrypoint.sh /usr/local/bin/
ENTRYPOINT ["entrypoint.sh"]

EXPOSE 80 2098 2099 8082 9092 5435

HEALTHCHECK --interval=1m --timeout=3s \
    CMD curl -f http://localhost/historian || exit 1