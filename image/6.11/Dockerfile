FROM node:6.11-alpine

# COPY INSTALL SCRIPTS
COPY ./image/*.sh /tmp/
RUN chmod +x /tmp/*.sh

WORKDIR /tmp

RUN sh ./env.sh && \
    sh ./apk.sh && \
    sh ./qa.sh

WORKDIR /root
