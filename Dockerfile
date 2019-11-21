FROM alpine:latest

ARG VERSION=2.3.1
ARG CHECKSUM=c7036c6d4d02f468c9692957417af521a3d54a151c99acbcc70e542812c993032822306653916576687707aea1eb4a56e416aa9e3e082efd70f563d9c76e556c

WORKDIR /tmp

ADD https://github.com/mdzio/ccu-historian/releases/download/${VERSION}/ccu-historian-${VERSION}-bin.zip .

RUN echo "${CHECKSUM}  ccu-historian-${VERSION}-bin.zip" | sha512sum -c - && \
    mkdir /tmp/ccu-historian && \
    unzip ccu-historian-${VERSION}-bin.zip -d /tmp/ccu-historian

FROM openjdk:8-jre

ENV TZ UTC

WORKDIR /opt/ccu-historian

RUN mkdir -p /database && \
    echo $TZ > /etc/timezone

COPY --from=0 /tmp/ccu-historian /opt/ccu-historian

VOLUME ["/opt/ccu-historian/config", "/database"]

COPY docker-entrypoint.sh /usr/local/bin/
ENTRYPOINT ["docker-entrypoint.sh"]

EXPOSE 80 2098 2099

HEALTHCHECK --interval=1m --timeout=3s \
    CMD curl -f http://localhost/historian || exit 1