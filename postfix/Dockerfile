FROM ubuntu:22.04
RUN apt update
RUN apt install -y postfix dumb-init

COPY virtual_alias /etc/postfix/virtual_alias
COPY entrypoint.sh /entrypoint.sh
RUN chmod go+x /entrypoint.sh


ENTRYPOINT ["dumb-init", "/entrypoint.sh"]
