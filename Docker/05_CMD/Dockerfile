FROM ubuntu:20.04

RUN apt-get --assume-yes update && \
    apt-get --assume-yes install iputils-ping

CMD ping localhost
#CMD tail -f /dev/null
