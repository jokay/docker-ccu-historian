ARG VERSION=2.6.0
ARG CHECKSUM=f7c9250746616b0f590e52b6864d67bcf2fdb0e665f7c1279bbb36cd669205288a4844684aaa06ba45ce2281ecab5307b95b0d70d211c4a99b6b431f9b8dd3b0

FROM docker.io/alpine:3.13.2 AS build

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

ENV VERSION ${VERSION} \
    TZ UTC

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