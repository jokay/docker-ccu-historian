FROM alpine:latest

ARG VERSION=2.2.1
ARG CHECKSUM=1c53585aeb3ebac7da1df0f9bb854d773deaf859697dc4df9c55d2fde31de1a6039176da075f5379fb749b36fa836010b6b386bc319bfb252235c116bfea6e42

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