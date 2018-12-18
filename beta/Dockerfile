FROM openjdk:8-jre
MAINTAINER D. Domig <x@jokay.ch>

ADD ./run.sh /tmp/

WORKDIR /tmp

ENV APP=https://github.com/mdzio/ccu-historian/releases/download/2.0.0-beta.5/ccu-historian-2.0.0-beta.5-bin.zip
ENV APP_CKS=5dffa8a8c2deb6a099edaa9b7317e6eafe1c7d60bbaa0932ebf2a000ab8158f5d9ce70a46a2b71ad2a4f57a263df1d0c0d9ef129eeed025fc64d1ee1807c791a
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