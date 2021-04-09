FROM ubuntu:16.04

ENV APACHE_RUN_USER www-data

ENV APACHE_RUN_GROUP www-data

ENV APACHE_LOCK_DIR /var/lock/apache2

ENV APACHE_LOG_DIR /var/log/apache2

ENV APACHE_PID_FILE /var/run/apache2/apache2.pid

ENV APACHE_SERVER_NAME localhost

RUN apt-get update

RUN apt-get install -y apache2

RUN rm -rf /var/lib/apt/lists/*

COPY apache-conf /etc/apache2/apache2.conf

EXPOSE 80

CMD ["/usr/sbin/apache2ctl", "-DFOREGROUND"]

COPY index.html /var/www/html/index.html
