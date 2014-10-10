# ![](https://gravatar.com/avatar/11d3bc4c3163e3d238d558d5c9d98efe?s=64) aptible/cron-example

Example implementation of cron jobs on Docker/Aptible

## Installation and Usage

    git clone https://github.com/aptible/docker-cron-example
    cd docker-cron-example/
    make run

The example will print "aptible/docker-cron-example" once every minute.

## Including Within An App On Aptible

To include within an Aptible app, copy the three body lines of the Dockerfile to your own Dockerfile:

    RUN apt-get -y install rsyslog
    ADD files/etc/crontab /etc/crontab
    RUN touch /var/log/cron.log

Then, copy files/etc/crontab to your own repo, replacing `echo aptible/docker-cron-example` with your own task, and `* * * * *` with your own desired job schedule.

Finally, add an entry in your Procfile for the new `cron` process:

    cron: rsyslogd && cron && tail -f /var/log/syslog /var/log/cron.log

## Copyright and License

MIT License, see [LICENSE](LICENSE.md) for details.

Copyright (c) 2014 [Aptible](https://www.aptible.com), [Frank Macreery](https://github.com/fancyremarker), and contributors.
