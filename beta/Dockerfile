FROM openjdk:8-jre
LABEL MAINTAINER D. Domig <x AT jokay DOT ch>

ENV VERSION 2.2.0-beta.3
ENV CHECKSUM 20233d59cef6c2a4707686b1e085e9f5921e05d126b0b49ebf52efa9bb58ad6b34dbf664a3f78b0d85a4be2e9026305d13ae699674bb12e0ff2cff9e60d28379
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