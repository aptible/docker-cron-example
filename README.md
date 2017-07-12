# ![](https://gravatar.com/avatar/11d3bc4c3163e3d238d558d5c9d98efe?s=64) aptible/cron-example

_Note: this repository is deprecated. Going forward, we recommend using
[Supercronic][supercronic] instead._

---

Example implementation of cron jobs on Docker/Aptible

## Installation and Usage

    git clone https://github.com/aptible/docker-cron-example
    cd docker-cron-example/
    make run

The example will print "aptible/docker-cron-example" once every minute.

## Including Within An App On Aptible

To include within an Aptible app, copy the following 5 body lines of the Dockerfile to your own Dockerfile:

    RUN apt-get -y install rsyslog
    ADD files/crontab /app/crontab
    RUN crontab /app/crontab
    ADD files/bin/start-cron.sh /usr/bin/start-cron.sh
    RUN chmod +x /usr/bin/start-cron.sh
    RUN touch /var/log/cron.log

* Installs ```rsyslog``` http://www.rsyslog.com/
* Copies ```crontab``` file from repo/app data to Docker and installs to user's ```crontab```
* Copies ```start-cron.sh``` from repo/app data to Docker
* Adjusts permissions
* Creates log file at ```/var/log/cron.log```

Then, copy ```files``` to your own repo, editing ```files/etc/crontab``` with your own task, and `* * * * *` with your own desired job schedule.

Crash course on cron(tab) job schedules https://en.wikipedia.org/wiki/Cron#Format. Consider the asterisk (```*```) like a wild card. Left to rigt the argument positions are:

```
[Minute Arg] [Hours Arg] [Day of month arg] [Month arg] [Day of week]
```

To run every 5 minutes:

```
*/5 * * * *
```

To run every 5 hours:

```
0 */5 * * *
```



Finally, add an entry in your Procfile for the new `cron` process:

    cron: /usr/bin/start-cron.sh

## Copyright and License

MIT License, see [LICENSE](LICENSE.md) for details.

Copyright (c) 2015 [Aptible](https://www.aptible.com) and contributors.

[<img src="https://s.gravatar.com/avatar/f7790b867ae619ae0496460aa28c5861?s=60" style="border-radius: 50%;" alt="@fancyremarker" />](https://github.com/fancyremarker)

  [supercronic]: https://github.com/aptible/supercronic/
