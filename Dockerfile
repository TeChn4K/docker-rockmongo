FROM ubuntu:12.04

# update ubuntu
RUN apt-get update

# install required
RUN apt-get install -q -y build-essential apache2 php5 libapache2-mod-php5 php5-dev php-pear wget unzip

# set environment variables for apache
ENV APACHE_RUN_USER www-data
ENV APACHE_RUN_GROUP www-data
ENV APACHE_LOG_DIR /var/log/apache2

#install mongo drivers
RUN pecl install mongo
RUN touch /etc/php5/conf.d/mongo.ini && echo "extension=mongo.so" >> /etc/php5/conf.d/mongo.ini

# install RockMongo
RUN cd /tmp \ 
  && wget --no-check-certificate https://github.com/gilacode/rockmongo/archive/master.zip -O rockmongo-master.zip \
  && unzip rockmongo-master.zip \ 
  && rm -fr /var/www \ 
  && mv /tmp/rockmongo-master/ /var/www

# increase php upload size
RUN sed -i 's/upload_max_filesize = 2M/upload_max_filesize = 10M/g' /etc/php5/apache2/php.ini
RUN sed -i 's/post_max_size = 2M/post_max_size = 10M/g' /etc/php5/apache2/php.ini

ADD ./config.php /var/www/config.php

ENTRYPOINT ["/usr/sbin/apache2"]
CMD ["-D", "FOREGROUND"]
