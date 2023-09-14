# kics-scan disable=fd54f200-402c-4333-a5a4-36ef6709af2f

ARG VERSION=3.4.0
ARG CHECKSUM=2706fe726cafc4b89e7a446d120ca2780abeb9e924d91552c608ee9e5acdca7719d61f2ec03043de7553aa05cf06e1d3f46bbac26428290fb314d4fd3a6f890b

# https://hub.docker.com/_/alpine
FROM docker.io/alpine:3.18.3@sha256:7144f7bab3d4c2648d7e59409f15ec52a18006a128c733fcff20d3a4a54ba44a AS build

ARG VERSION
ARG CHECKSUM

WORKDIR /tmp

# hadolint ignore=DL4006
RUN wget -q -O ccu-historian-${VERSION}-bin.zip https://github.com/mdzio/ccu-historian/releases/download/${VERSION}/ccu-historian-${VERSION}-bin.zip && \
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