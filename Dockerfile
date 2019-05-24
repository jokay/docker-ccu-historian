FROM alpine:latest as download
LABEL MAINTAINER="D. Domig <x AT jokay DOT ch>"

ENV VERSION 2.1.0
ENV CHECKSUM 14786557228b76d2c000d71da494dc7925c2464ebe546caf41ac84f5fc1f63de96380e8a1e76c5ae0f654c9bfeb180685770c9e12e923f07732a7330aae39778

WORKDIR /tmp

ADD https://github.com/mdzio/ccu-historian/releases/download/${VERSION}/ccu-historian-${VERSION}-bin.zip .

RUN echo "${CHECKSUM}  ccu-historian-${VERSION}-bin.zip" | sha512sum -c - && \
    mkdir /tmp/ccu-historian && \
    unzip ccu-historian-${VERSION}-bin.zip -d /tmp/ccu-historian 



FROM openjdk:8-jre-alpine

ENV CONFIG_TYPE CCU2
ENV TZ UTC 

RUN mkdir -p /opt/ccu-historian /database && \
    apk add --no-cache tzdata


COPY --from=download /tmp/ccu-historian /opt/ccu-historian

COPY ./entrypoint.sh /entrypoint.sh

EXPOSE 80 2098 2099

VOLUME ["/database","/opt/ccu-historian/config"]

ENTRYPOINT ["sh","/entrypoint.sh"]
