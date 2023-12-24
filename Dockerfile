FROM debian:buster-slim

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get -y update && apt-get -y install gcc sox 

RUN mkdir /app
ADD . /app
WORKDIR /app

RUN chmod a+rx /app/entrypoint.sh
RUN gcc pocsag.c -o pocsac && cp ./pocsac /usr/bin
RUN gcc bin2audio.c -o bin2audio && cp ./bin2audio /usr/bin

ENTRYPOINT ["/app/entrypoint.sh"]
