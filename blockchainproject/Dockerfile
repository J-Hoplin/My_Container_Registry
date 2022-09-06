FROM ubuntu

LABEL maintainer="hoplin"
LABEL email="jhoplin7259@gmail.com"

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
# 

# Make Local Volume mount directory
RUN mkdir project

# npm init
RUN ["/bin/bash", "-c","cd project"]

# Export default volume
VOLUME ["/home/project"]


# Set baisc directory
WORKDIR /home
# Expose port
# - Nginx
# - Apache Tomcat
# - mysql, postgresql
# - harbor
EXPOSE 80 443 3306 
