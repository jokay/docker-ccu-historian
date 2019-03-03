FROM openjdk:8-jre
LABEL MAINTAINER D. Domig <x AT jokay DOT ch>

ENV VERSION 2.2.0-beta.1
ENV CHECKSUM 33d67b5d5a35350d9786e44a9021dc67fad816cd32512d3063b5c1c0479b21101241df23c86ae1fda7aeefc6e1113e994692e20b1a430754415228ea054de4b3
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