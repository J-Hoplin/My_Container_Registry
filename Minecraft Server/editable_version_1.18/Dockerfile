FROM openjdk

LABEL maintainer="hoplin"
LABEL email="jhoplin7259@gmail.com"

ENV maxmem="4096"
ENV minmem="1024"

# Install yum
RUN microdnf install yum

#Set timezone to kst
RUN ln -sf /usr/share/zoneinfo/Asia/Seoul /etc/localtime

# Install systemd
RUN yum install systemd -y

# Install initscript
RUN yum install initscripts -y

# Install VIM
RUN yum install vim -y

# Install wget
RUN yum install wget -y

# Make minecraft directory
RUN mkdir minecraft
# Decide working directory
WORKDIR /minecraft

# Add Auth of directory 
RUN chmod -R 777 $(pwd)

COPY entrypoint.sh /usr/bin/docker-entrypoint.sh

# Enroll alias
RUN echo "alias initServer=\"bash /usr/bin/docker-entrypoint.sh\"" >> $HOME/.bashrc
RUN echo "alias startServer=\"java -Xmx${maxmem}M -ms${minmem}M -jar server.jar nogui\"" >> $HOME/.bashrc
RUN source $HOME/.bashrc

VOLUME [ "/minecraft" ]
EXPOSE 25565 25575