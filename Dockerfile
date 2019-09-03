FROM alpine:latest

ARG VERSION=2.2.0
ARG CHECKSUM=7653e7b5b7d645e56e250e47089c4d3b60689cbc649fc9b69ae4ba479e130890c67917df4e9270a87316455cfd30e212aaaf9bbd9167ce166de45c337dbc067f

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