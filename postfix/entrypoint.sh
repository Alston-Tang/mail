#!/bin/bash

echo "check if user vmail exists"
if id vmail; then
	echo "user vmail exists"
else
	useradd -m -U vmail
fi

postconf -e "mydestination=${DOMAIN}"
postconf -e "smtpd_tls_cert_file=${SSL_CERT}"
postconf -e "smtpd_tls_key_file=${SSL_KEY}"
postconf -e "virtual_alias_maps=regexp:/etc/postfix/virtual_alias"
postconf -e "maillog_file=/dev/stdout"

exec /usr/sbin/postfix -c /etc/postfix start-fg
