ARG VERSION=2.5.2
ARG CHECKSUM=2bf0347c8f1f2270c6095f18ce29c6f6c5bf7da90ce080bc2eab1e497cb5723672c51b0dbcfca1300026f9647050a3c1ca4b26f116e21ff54b686337b7607b99

FROM alpine:3.12.3 AS build

ARG VERSION
ARG CHECKSUM

WORKDIR /tmp

ADD https://github.com/mdzio/ccu-historian/releases/download/${VERSION}/ccu-historian-${VERSION}-bin.zip .

# hadolint ignore=DL4006
RUN echo "${CHECKSUM}  ccu-historian-${VERSION}-bin.zip" | sha512sum -c - && \
    mkdir /tmp/ccu-historian && \
    unzip ccu-historian-${VERSION}-bin.zip -d /tmp/ccu-historian

FROM adoptopenjdk:11.0.9.1_1-jre-hotspot

ARG MAINTAINER
ARG REPOSITORY
ARG VERSION
ARG COMMIT
ARG DATE

LABEL Maintainer=${MAINTAINER} \
      Repository=${REPOSITORY} \
      Version=${VERSION} \
      Commit=${COMMIT} \
      Date=${DATE}

ENV VERSION ${VERSION}

ENV TZ UTC

WORKDIR /opt/ccu-historian

RUN mkdir -p /database && \
    echo ${TZ} > /etc/timezone

COPY --from=build /tmp/ccu-historian /opt/ccu-historian

VOLUME ["/opt/ccu-historian/config", "/database"]

COPY docker-entrypoint.sh /usr/local/bin/
ENTRYPOINT ["docker-entrypoint.sh"]

EXPOSE 80 2098 2099 8082 9092 5435

HEALTHCHECK --interval=1m --timeout=3s \
    CMD curl -f http://localhost/historian || exit 1