FROM node:hydrogen-buster 
# This node.js docker image version is v.18

LABEL maintainer="Hoplin"

RUN apt-get update\
&& apt-get upgrade -y\
&& apt-get install libaio1\
&& mkdir -p /opt/oracle\
&& cd /opt/oracle\
&& wget https://download.oracle.com/otn_software/linux/instantclient/191000/instantclient-basic-linux.x64-19.10.0.0.0dbru.zip\
&& unzip instantclient-basic-linux.x64-19.10.0.0.0dbru.zip\
&& sh -c "echo /opt/oracle/instantclient_19_10 > /etc/ld.so.conf.d/oracle-instantclient.conf"\
&& ldconfig\
&& export LD_LIBRARY_PATH=/opt/oracle/instantclient_19_10:$LD_LIBRARY_PATH

RUN mkdir api
WORKDIR /api

# Copy dockerfile's directory to docker workind directory
COPY . .
# npm packagees installation
RUN npm install

# Swagger UI and Application
EXPOSE 3000 4000
# Basic execuiton command
CMD [ "node","app.js" ]