FROM openjdk:8-jre
LABEL MAINTAINER D. Domig <x AT jokay DOT ch>

ENV VERSION 2.2.0-beta.4
ENV CHECKSUM e33b371b17859c6947f54758610b180b39f6512499100fb2c290ef4266efc83d20bc922ad182152212949f438ac04f93bf52caaa8c0ae04c93bc520315df47b9
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