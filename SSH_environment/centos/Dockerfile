FROM centos

LABEL maintainer="hoplin"
LABEL email="jhoplin7259@gmail.com"

# Warning : With running this resource you need to run container with privileged option

# Due to RHEL 8, Centos8 mirror site converted to vault
# Require to change mirror site to vault
RUN sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-Linux-*
RUN sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-Linux-*

# Cent OS Package update
RUN yum install epel-release -y

# Install firewall and enable firewall
RUN yum install firewalld -y

# Install Centos InitScript
RUN yum install initscripts -y

# Install Systemd for privileged container
RUN yum install systemd -y

# Change root password - default password : centos123
RUN echo 'root:centos123' | chpasswd

# Set default working directory to "/home"
WORKDIR /home

RUN mkdir /home/init

# Copy init.sh : hidden file
COPY /shell /home/init
# Grant permission to shell file
RUN chmod +x /home/init/init.sh

# Enroll Alias 
RUN echo "alias initenv=\"bash init/init.sh\"" >> $HOME/.bashrc
RUN source $HOME/.bashrc

# Expose ssh
EXPOSE 22