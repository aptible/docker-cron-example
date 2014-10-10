FROM quay.io/aptible/ubuntu:14.04

RUN apt-get -y install rsyslog

# Add this line to your own Dockerfile
ADD files/etc/crontab /etc/crontab
RUN touch /var/log/cron.log

CMD rsyslogd && cron && tail -f /var/log/syslog /var/log/cron.log
