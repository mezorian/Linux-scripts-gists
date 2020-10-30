FROM ubuntu:20.04

ARG userName=anon
ARG password='anon'
ARG userID=5000
ARG groupID=100

RUN apt-get --assume-yes update && \
    apt-get --assume-yes install sudo

# we are by default root
RUN whoami

# now we create a new user
COPY create_user.sh .
RUN ./create_user.sh --username="${userName}" --password=${password} \
                     --userid=${userID} --groupid=${groupID}

# we can switch to this new user now
USER ${userName}
RUN whoami
