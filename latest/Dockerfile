FROM openjdk:8-jre
MAINTAINER D. Domig <x AT jokay DOT ch>

ADD ./run.sh /tmp/

WORKDIR /tmp

ENV APP=https://github.com/mdzio/ccu-historian/releases/download/2.0.0/ccu-historian-2.0.0-bin.zip
ENV APP_CKS=1d24406d2ffb9d47b2f460638ee7185eab9d060340866e1bc8f3371ae0d2ce8eecf9f5edbcc3cac5688c021d8213206ccd3805b4fad289d35a5ee9be525ad908
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

ENTRYPOINT ["bash","/opt/ccu-historian/run.sh"]