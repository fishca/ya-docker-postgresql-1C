# Pull from the ubuntu:14.04 image
FROM ubuntu:14.04

# Set the author
MAINTAINER team@silverbulleters.org

ENV DEBIAN_FRONTEND noninteractive

# Update cache and install packages
RUN apt-get update && apt-get -y install \
    software-properties-common \
    # python-software-properties \
    debian-archive-keyring \
    wget \
    curl \
    make \
    # vim \
    # aptitude \
    # dialog \
    # net-tools \
    # mcrypt \
    # build-essential \
    # tcl8.5 \
    # git \
    cron \
    # unzip \
    supervisor \
    rsyslog 
    # php5-fpm \
    # php5-cli \
    # php5-mysql \
    # php5-curl \
    # php5-mcrypt \
    # php5-gd \
    # php5-redis \
    # php5-sqlite
    # mysql-server

# Download Nginx signing key
RUN apt-key adv --recv-keys --keyserver keyserver.ubuntu.com C300EE8C

# Add to repository sources list
RUN add-apt-repository ppa:nginx/stable

# Update cache and install Nginx
RUN apt-get update && apt-get -y install \
    nginx 

RUN apt-get clean; \
	rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
	
RUN mkdir -p /var/log/supervisor

RUN sed -i 's/#cron/cron/g' /etc/rsyslog.d/50-default.conf

# # Mysql
# RUN sed -i 's/^\(bind-address\s.*\)/# \1/' /etc/mysql/my.cnf && \
# 	sed -i 's/^\(log_error\s.*\)/# \1/' /etc/mysql/my.cnf && \
# 	echo "mysqld_safe &" > /tmp/config && \
# 	echo "mysqladmin --silent --wait=30 ping || exit 1" >> /tmp/config && \
# 	echo "mysql -e 'GRANT ALL PRIVILEGES ON *.* TO \"root\"@\"%\" WITH GRANT OPTION;'" >> /tmp/config && \
# 	echo "mysql -e 'UPDATE mysql.user SET password=PASSWORD(\"root\") WHERE User=\"root\";'" >> /tmp/config && \
# 	echo "mysql -e 'CREATE DATABASE default;'" >> /tmp/config && \
# 	echo "mysql -e 'FLUSH PRIVILEGES;'" >> /tmp/config && \
# 	bash /tmp/config && \
# 	rm -f /tmp/config

# Turn off daemon mode
# Reference: http://stackoverflow.com/questions/18861300/how-to-run-nginx-within-docker-container-without-halting
RUN echo "\ndaemon off;" >> /etc/nginx/nginx.conf

# Run nginx and php-fpm as root
RUN sed -i 's/www-data/root/g' /etc/nginx/nginx.conf
# RUN sed -i 's/www-data/root/g' /etc/php5/fpm/pool.d/www.conf

# Backup the default configurations
# RUN cp /etc/php5/fpm/php.ini /etc/php5/fpm/php.ini.original.bak
RUN mv /etc/nginx/sites-available/default /etc/nginx/sites-available/default.original

# # Configure PHP settings
# RUN perl -pi -e 's/;cgi.fix_pathinfo=1/cgi.fix_pathinfo=0/g' /etc/php5/fpm/php.ini
# RUN perl -pi -e 's/allow_url_fopen = Off/allow_url_fopen = On/g' /etc/php5/fpm/php.ini
# RUN perl -pi -e 's/expose_php = On/expose_php = Off/g' /etc/php5/fpm/php.ini

# Copy nginx site conf
COPY nginx.conf /etc/nginx/sites-available/default

# Remove default page
RUN rm /var/www/html/index.nginx-debian.html

# COPY rm_mysql /usr/bin/rm_mysql
# RUN chmod 0755 /usr/bin/rm_mysql

# Copy the supervisord.conf file
COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf

# Add pgbadger
ENV PGBDRVER=9.2

# RUN mkdir -p /var/www/pg_reports

ADD https://github.com/dalibo/pgbadger/archive/v$PGBDRVER.tar.gz /tmp/

# RUN unzip -d /tmp /tmp/pgbadger.zip && \
#     rm /tmp/pgbadger.zip

WORKDIR /tmp/

RUN tar xzf v$PGBDRVER.tar.gz && \
    rm /tmp/v$PGBDRVER.tar.gz

WORKDIR /tmp/pgbadger-$PGBDRVER

RUN perl Makefile.PL && make && make install

RUN pgbadger --version

COPY start_analyze.sh /usr/local/bin/start_analyze.sh

# Copy the crontab file
COPY start-pgbadger-cron /etc/cron.d/start-pgbadger-cron
RUN chmod 0644 /etc/cron.d/start-pgbadger-cron

# Mount volumes
VOLUME ["/etc/nginx/certs", "/etc/nginx/conf.d", "/var/www/html", "/srv/"]

# Boot up supervisord when container is started
CMD ["/usr/bin/supervisord"]

# Set the current working directory
WORKDIR /var/www/html

# Expose port 80
EXPOSE 80
# EXPOSE 443