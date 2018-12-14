FROM openjdk:8-jre-alpine
MAINTAINER D. Domig <x@jokay.ch>

ADD ./run.sh /tmp/

WORKDIR /tmp

ENV APP=https://github.com/mdzio/ccu-historian/releases/download/2.0.0-beta.5/ccu-historian-2.0.0-beta.5-bin.zip
ENV CONFIG_TYPE=CCU2
ENV TZ=UTC

RUN apk add --no-cache curl && \
mkdir -p /opt/ccu-historian /database && \
curl -SL ${APP} --output ccu-historian.zip && \
unzip ccu-historian.zip -d /opt/ccu-historian && \
chmod +x run.sh && \
mv run.sh /opt/ccu-historian && \
rm -fv ccu-historian.zip && \
ln -nsf /usr/share/zoneinfo/$TZ /etc/localtime && \
echo $TZ > /etc/timezone

EXPOSE 80 2098 2099

VOLUME ["/database","/opt/ccu-historian/config"]

ENTRYPOINT ["/opt/ccu-historian/run.sh"]