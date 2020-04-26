FROM alpine:latest

ARG VERSION=2.3.0
ARG CHECKSUM=e71cdb81dab9bd16e0773ab5eee0e362bcd981836dfd87a87a89321017bd96898531100259a5d0b70788f64cb5295456ce155a2a245c8b5d711add97c817e902

WORKDIR /tmp

ADD https://github.com/mdzio/ccu-historian/releases/download/${VERSION}/ccu-historian-${VERSION}-bin.zip .

RUN echo "${CHECKSUM}  ccu-historian-${VERSION}-bin.zip" | sha512sum -c - && \
    mkdir /tmp/ccu-historian && \
    unzip ccu-historian-${VERSION}-bin.zip -d /tmp/ccu-historian

FROM openjdk:8-jre

ENV TZ UTC
ENV GID 999
ENV UID 999

WORKDIR /opt/ccu-historian

RUN groupadd -g ${GID} ccuhistorian && \
    useradd -m -r -u ${UID} -g ccuhistorian ccuhistorian && \
    echo ${TZ} > /etc/timezone

COPY --chown=ccuhistorian:ccuhistorian --from=0 /tmp/ccu-historian /opt/ccu-historian

COPY --chown=ccuhistorian:ccuhistorian docker-entrypoint.sh /usr/local/bin/
ENTRYPOINT ["docker-entrypoint.sh"]

VOLUME ["/opt/ccu-historian/config", "/database"]

EXPOSE 8080 2098 2099

HEALTHCHECK --interval=1m --timeout=3s \
    CMD curl -f http://localhost:8080/historian || exit 1

USER ccuhistorian