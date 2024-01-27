# kics-scan disable=fd54f200-402c-4333-a5a4-36ef6709af2f

ARG VERSION=3.5.0
ARG CHECKSUM=8517f9c2ce11b50e4b44d1b7ae755e8e503c73a0de66e33237e3f02ec593fb7c0f4247e5b1a74980daad773c1f19b038f947ec977ff07f2be0e665d7bdf0eacc

# https://hub.docker.com/_/alpine
FROM docker.io/alpine:3.19.1@sha256:c5b1261d6d3e43071626931fc004f70149baeba2c8ec672bd4f27761f8e1ad6b AS build

ARG VERSION
ARG CHECKSUM

WORKDIR /tmp

# hadolint ignore=DL4006
RUN wget -q -O ccu-historian-${VERSION}-bin.zip https://github.com/mdzio/ccu-historian/releases/download/v${VERSION}/ccu-historian-${VERSION}-bin.zip && \
    printf "%s  ccu-historian-%s-bin.zip" "${CHECKSUM}" "${VERSION}" | sha512sum -c - && \
    mkdir /tmp/ccu-historian && \
    unzip "ccu-historian-${VERSION}-bin.zip" -d /tmp/ccu-historian

# https://hub.docker.com/_/eclipse-temurin
FROM docker.io/eclipse-temurin:19.0.2_7-jre-focal@sha256:4f646d9ba7737e089a937d7a40427f8757f366829a03937b37112e2db5264b54

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