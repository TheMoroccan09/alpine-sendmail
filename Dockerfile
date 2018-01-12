FROM themoroccan09/alpine-bash


# CREATE FILES FOLDERS -------------------
RUN rm -rf /etc/ssl &&\
	touch /var/log/sendmail.log

# INSTALL PACKAGES ------------------------
RUN apk update && apk upgrade
RUN apk add --no-cache \
	nano \
	msmtp \
	openssl \
	ca-certificates

# DOWNLOAD CERTS -------------------------
RUN update-ca-certificates

# MSMTP CONFIGURATION -------------------
COPY msmtprc /etc/msmtprc
COPY msmtp-sendmail.start /etc/local.d/msmtp-sendmail.start
RUN chmod +x /etc/local.d/msmtp-sendmail.start
