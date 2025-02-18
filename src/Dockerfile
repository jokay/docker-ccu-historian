# kics-scan disable=fd54f200-402c-4333-a5a4-36ef6709af2f

ARG VERSION=4.1.0
ARG CHECKSUM=a3a28f8138638b99176c2abbcb4b4fa2e3b2b66738a70e6196c7210a26a6a9c93fd2a8d86daa2e5058c718eca7ea5adb5ed7eef1c146ea332a32fbf8b993b01d

# https://hub.docker.com/_/alpine
FROM docker.io/alpine:3.21.3@sha256:a8560b36e8b8210634f77d9f7f9efd7ffa463e380b75e2e74aff4511df3ef88c AS build

ARG VERSION
ARG CHECKSUM

WORKDIR /tmp

# hadolint ignore=DL4006
RUN wget -q -O ccu-historian-${VERSION}-bin.zip https://github.com/mdzio/ccu-historian/releases/download/v${VERSION}/ccu-historian-${VERSION}-bin.zip && \
    printf "%s  ccu-historian-%s-bin.zip" "${CHECKSUM}" "${VERSION}" | sha512sum -c - && \
    mkdir /tmp/ccu-historian && \
    unzip "ccu-historian-${VERSION}-bin.zip" -d /tmp/ccu-historian

# https://hub.docker.com/_/eclipse-temurin
FROM docker.io/eclipse-temurin:17.0.14_7-jre-focal@sha256:084f4944e5f6472583ce1fc319a704e5c441cebcd55ac27b1bf31bd3878bc1f1

ARG VERSION

ENV VERSION="${VERSION}"
ENV TZ="UTC"

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