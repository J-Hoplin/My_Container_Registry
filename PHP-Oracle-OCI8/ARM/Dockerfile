FROM ubuntu

LABEL maintainer="hoplin"
LABEL email="jhoplin7259@gmail.com"

# Non Interactive set
ARG DEBIAN_FRONTEND=noninteractive
# Set timezone
ENV TZ=Asia/Seoul

# Update packages
RUN apt-get update -y && apt-get upgrade -y
# Install tzdata
RUN apt-get install tzdata -y
# Install php
RUN apt-get install php8.0 -y
# Install apache-php
RUN apt-get install libapache2-mod-php -y
# Install essential utils
RUN apt-get install git gcc libaio1 wget unzip php-dev php-pear build-essential curl vim -y
# # Restart apache2
# RUN service apache2 restart
# Install SSH
RUN apt-get install openssh-server -y

# Setting Oracle Client and OCI8
RUN mkdir -p /usr/lib/oracle/client\
&& cd /usr/lib/oracle/client\
&& wget https://download.oracle.com/otn_software/linux/instantclient/191000/instantclient-basic-linux.arm64-19.10.0.0.0dbru.zip\
&& wget https://download.oracle.com/otn_software/linux/instantclient/191000/instantclient-sdk-linux.arm64-19.10.0.0.0dbru.zip\
&& for i in instantclient*zip; do unzip $i; done\
&& rm instantclient*zip && mv instantclient_19_10 lib\
&& ls lib\
&& echo /usr/lib/oracle/client/lib > /etc/ld.so.conf.d/oracle.conf\
&& echo "ORACLE_HOME=/usr/lib/oracle/client/lib" >> /etc/profile\
&& ldconfig\
&& pecl channel-update pecl.php.net\
&& echo 'instantclient,/usr/lib/oracle/client/lib/' | pecl install oci8\
&& echo "extension=oci8.so" >> /etc/php/8.1/cli/php.ini\
&& cd /etc/php/8.1/mods-available && echo "extension=oci8.so" >> oci.ini\
&& cd /etc/php/8.1/apache2/conf.d && ln -s /etc/php/8.1/mods-available/oci.ini 20-oci.ini

# <Script Description>
# ln[28] : Install Oracle Instant Client : Basic
# ln[29] : Install Oracle Instant Client : SDK
# ln[30] : Unzip instant client
# ln[31] : Delete client zip file
# ln[34] : Enroll oracle home env variable
# ln[35] : Update dynamic linker
# ln[36] : Update PECL(PHP Extension Community Library)
# ln[37] : Install oci8
# ln[38] : Enroll oci8 to php.ini
# ln[39] : Add to mods-available
# ln[40] : Make symbolic link about oci.ini

# Install composer & laravel
RUN cd ~\
&& curl -sS https://getcomposer.org/installer | php\
&& mv composer.phar /usr/local/bin/composer\
&& chmod +x /usr/local/bin/composer\
&& composer global require laravel/installer\
&& ln -s /root/.config/composer/vendor/bin/laravel /usr/bin/laravel

# Set working directory
WORKDIR /var/www/html
# Volume : PHP default volume
VOLUME [ "/var/www/html" ]
# Port : 22 - ssh 80 - web server index
EXPOSE 22 80
# Start ssh and set apache as daemon
CMD service ssh start && apachectl -D FOREGROUND