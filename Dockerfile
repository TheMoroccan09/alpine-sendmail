FROM themoroccan09/alpine-bash

RUN apk update && apk upgrade
RUN apk add --no-cache nano msmtp

RUN rm -rf /etc/ssl && touch /var/log/sendmail.log
RUN apk add --no-cache openssl ca-certificates && update-ca-certificates

COPY msmtprc /etc/msmtprc
COPY msmtp-sendmail.start /etc/local.d/msmtp-sendmail.start
RUN chmod +x /etc/local.d/msmtp-sendmail.start
