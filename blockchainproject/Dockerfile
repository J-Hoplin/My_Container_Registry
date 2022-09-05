FROM ubuntu

# Ubuntu default packages update upgrade
RUN apt-get update -y
RUN apt-get upgrade -y

#Container default settings

# install sudo
RUN apt-get install sudo -y
# install npm
RUN apt-get install npm -y
# install hostname
RUN apt-get install hostname -y

# Set baisc directory
WORKDIR /home

# Export default volume
VOLUME ["/home"]

# Expose port
# - Nginx
# - Apache Tomcat
# - mysql, postgresql
# - harbor
EXPOSE 80 443 3306 
