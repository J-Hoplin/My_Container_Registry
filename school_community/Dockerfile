FROM node:16

LABEL maintainer="hoplin"
LABEL email="jhoplin7259@gmail.com"
LABEL organization="DSC Community"

# Update / Upgrade package list and install vim
RUN apt-get update -y
RUN apt-get upgrade -y
RUN apt-get install vim -y

# Set timezone to KST
RUN ln -sf /usr/share/zoneinfo/Asia/Seoul /etc/localtime

# Make app directory
# -p : Make parent direct ory if needed
RUN mkdir -p /apps
WORKDIR /apps

# Synchronize local and container registry
VOLUME [ "/apps" ]

# For later
EXPOSE 443 80

