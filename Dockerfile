FROM quay.io/aptible/ubuntu:14.04

# Add this line to your own Dockerfile
ADD files/etc/crontab /etc/crontab
RUN touch /var/log/cron.log

CMD cron && tail -f /var/log/cron.log
