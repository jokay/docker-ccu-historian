FROM openjdk:8-jre
LABEL MAINTAINER D. Domig <x AT jokay DOT ch>

ENV VERSION 2.2.0-beta.2
ENV CHECKSUM b72fc50cf52db3b8abcf617057cb1a44872b02d1bf0f493d7171b6626ee03e1cefd1f8c812579182463aa14aa27b1b984c7012c4a632be3b5be14d15ec3a2b3e
ENV CONFIG_TYPE CCU2
ENV TZ UTC

ADD ./run.sh /tmp/

WORKDIR /tmp

RUN apt-get install curl && \
mkdir -p /opt/ccu-historian /database && \
curl -SL https://github.com/mdzio/ccu-historian/releases/download/${VERSION}/ccu-historian-${VERSION}-bin.zip --output ccu-historian.zip && \
echo "${CHECKSUM}  ccu-historian.zip" | sha512sum -c - && \
unzip ccu-historian.zip -d /opt/ccu-historian && \
chmod +x run.sh && \
mv run.sh /opt/ccu-historian && \
rm -fv ccu-historian.zip && \
ln -nsf /usr/share/zoneinfo/$TZ /etc/localtime && \
echo $TZ > /etc/timezone

EXPOSE 80 2098 2099

VOLUME ["/database","/opt/ccu-historian/config"]

ENTRYPOINT ["bash","/opt/ccu-historian/run.sh"]