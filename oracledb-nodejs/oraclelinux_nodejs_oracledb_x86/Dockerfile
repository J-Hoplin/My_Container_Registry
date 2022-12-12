FROM oraclelinux:7-slim

LABEL maintainer="Hoplin"

RUN  yum -y install oracle-release-el7 oracle-nodejs-release-el7\
&& yum-config-manager --disable ol7_developer_EPEL\
&& yum -y install oracle-instantclient19.3-basiclite nodejs\
&& rm -rf /var/cache/yum

RUN mkdir api
WORKDIR /api

# Copy dockerfile's directory to docker workind directory
COPY . .
# npm packages installation
RUN npm install

# Swagger UI and Application
EXPOSE 3000 4000
# Basic command
CMD [ "node","app.js" ]