FROM openjdk:8-jre
LABEL MAINTAINER = 'D. Domig <x AT jokay DOT ch>'

ENV VERSION 2.1.0
ENV CHECKSUM 14786557228b76d2c000d71da494dc7925c2464ebe546caf41ac84f5fc1f63de96380e8a1e76c5ae0f654c9bfeb180685770c9e12e923f07732a7330aae39778
ENV CONFIG_TYPE CCU2
ENV TZ UTC

COPY ./run.sh /tmp/

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