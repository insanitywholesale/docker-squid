FROM alpine:3.12

ENV SQUID_VERSION=4.6 \
	SQUID_CACHE_DIR=/var/spool/squid \
	SQUID_LOG_DIR=/var/log/squid \
	SQUID_USER=proxy

#idk what the difference between squid and acf-squid is
#alpine wiki says to use acf-squid though
#RUN apk add squid

RUN apk add acf-squid

RUN apk add bash

COPY entrypoint.sh /sbin/entrypoint.sh
RUN chmod 755 /sbin/entrypoint.sh

EXPOSE 3128/tcp
ENTRYPOINT ["/sbin/entrypoint.sh"]
