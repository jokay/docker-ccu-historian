ARG VERSION=2.7.1
ARG CHECKSUM=baa03f482602a9ef92d3a13ce75cbaf00c98112f81f9bb92651ddd2cb014bbc5e64fa8782e457dafd2a27791b8ea6e72678dfa6514e10e4631a2a20c352c0b9b

FROM docker.io/alpine:3.14.3@sha256:635f0aa53d99017b38d1a0aa5b2082f7812b03e3cdb299103fe77b5c8a07f1d2 AS build

ARG VERSION
ARG CHECKSUM

WORKDIR /tmp

ADD https://github.com/mdzio/ccu-historian/releases/download/${VERSION}/ccu-historian-${VERSION}-bin.zip .

# hadolint ignore=DL4006
RUN printf "%s  ccu-historian-%s-bin.zip" "${CHECKSUM}" "${VERSION}" | sha512sum -c - && \
    mkdir /tmp/ccu-historian && \
    unzip "ccu-historian-${VERSION}-bin.zip" -d /tmp/ccu-historian

FROM docker.io/adoptopenjdk:11.0.11_9-jre-hotspot@sha256:ad6431b2e2a6f8016aa6d79c3f588783af9fdc06cafe131fd0d3faf560914b13

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