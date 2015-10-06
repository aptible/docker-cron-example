FROM quay.io/aptible/ubuntu:14.04

RUN apt-get -y install rsyslog

# Add these lines to your own Dockerfile
ADD files/etc/crontab /etc/crontab
ADD bin/start-cron.sh /usr/bin/start-cron.sh
RUN touch /var/log/cron.log

CMD /usr/bin/start-cron.sh
