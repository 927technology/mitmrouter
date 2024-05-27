# author: chris murray
# date 20240525
# mitm router

FROM        debian:trixie-20240513-slim
LABEL       maintainer="cmurray@927.technology"

ENV         version=0.0.2

# update system
RUN         apt update
RUN         apt upgrade -y

# install nox
RUN         useradd -m -d /etc/mitm mitm

# add mitm binaries
COPY        build/usr/local/bin/mitmdump   /usr/local/bin
COPY        build/usr/local/bin/mitmproxy  /usr/local/bin
COPY        build/usr/local/bin/mitmweb    /usr/local/bin

#set container user
USER        mitm

#entrypoint
COPY        build/usr/local/bin/entrypoint.sh /usr/local/bin/
ENTRYPOINT  /usr/local/bin/entrypoint.sh
