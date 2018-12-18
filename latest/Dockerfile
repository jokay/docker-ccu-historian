FROM openjdk:8-jre
MAINTAINER D. Domig <x@jokay.ch>

ADD ./run.sh /tmp/

WORKDIR /tmp

ENV APP=https://github.com/mdzio/ccu-historian/releases/download/1.2.0/ccu-historian-1.2.0-bin.zip
ENV APP_CKS=c530cf3459a9539f4e8f6329f991aa5c619045e91017487c2216ef6a25c754e846c5abf14f8575f52ae74254c00a4fe741a23865de32d404dc0e816680351a8c
ENV CONFIG_TYPE=CCU2
ENV TZ=UTC

RUN apt-get install curl && \
mkdir -p /opt/ccu-historian /database && \
curl -SL ${APP} --output ccu-historian.zip && \
echo "${APP_CKS}  ccu-historian.zip" | sha512sum -c - && \
unzip ccu-historian.zip -d /opt/ccu-historian && \
chmod +x run.sh && \
mv run.sh /opt/ccu-historian && \
rm -fv ccu-historian.zip && \
ln -nsf /usr/share/zoneinfo/$TZ /etc/localtime && \
echo $TZ > /etc/timezone

EXPOSE 80 2098 2099

VOLUME ["/database","/opt/ccu-historian/config"]

ENTRYPOINT ["sh","/opt/ccu-historian/run.sh"]