# kics-scan disable=fd54f200-402c-4333-a5a4-36ef6709af2f

ARG VERSION=4.0.1
ARG CHECKSUM=f3fb84f059b2aa6e6dc0fc47d4a2336b79a1c2b8862c667d61c36e654958d7c801117f3f7e332ebf6a27d4dcb41a85cc801a9ddbaea4365333e9cb2d9029ab28

# https://hub.docker.com/_/alpine
FROM docker.io/alpine:3.20.3@sha256:beefdbd8a1da6d2915566fde36db9db0b524eb737fc57cd1367effd16dc0d06d AS build

ARG VERSION
ARG CHECKSUM

WORKDIR /tmp

# hadolint ignore=DL4006
RUN wget -q -O ccu-historian-${VERSION}-bin.zip https://github.com/mdzio/ccu-historian/releases/download/v${VERSION}/ccu-historian-${VERSION}-bin.zip && \
    printf "%s  ccu-historian-%s-bin.zip" "${CHECKSUM}" "${VERSION}" | sha512sum -c - && \
    mkdir /tmp/ccu-historian && \
    unzip "ccu-historian-${VERSION}-bin.zip" -d /tmp/ccu-historian

# https://hub.docker.com/_/eclipse-temurin
FROM docker.io/eclipse-temurin:17.0.12_7-jre-focal@sha256:363fd3fbcc1bae65f2fc3b7d3c187034b83ce23bb6d878600ff7717577042e40

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