FROM ubuntu:20.04

RUN apt-get --assume-yes update && \
    apt-get --assume-yes install nginx

EXPOSE 80

CMD nginx && tail -f /dev/null
