FROM centos

LABEL maintainer="hoplin"
LABEL email="jhoplin7259@gmail.com"

# Warning : With running this resource you need to run container with privileged option
RUN (cd /lib/systemd/system/sysinit.target.wants/; for i in *; do [ $i == \
    systemd-tmpfiles-setup.service ] || rm -f $i; done); \
    rm -f /lib/systemd/system/multi-user.target.wants/*;\
    rm -f /etc/systemd/system/*.wants/*;\
    rm -f /lib/systemd/system/local-fs.target.wants/*; \
    rm -f /lib/systemd/system/sockets.target.wants/*udev*; \
    rm -f /lib/systemd/system/sockets.target.wants/*initctl*; \
    rm -f /lib/systemd/system/basic.target.wants/*;\
    rm -f /lib/systemd/system/anaconda.target.wants/*;

# Due to RHEL 8, Centos8 mirror site converted to vault
# Require to change mirror site to vault
RUN sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-Linux-*
RUN sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-Linux-*
# Install required packages if not installed
RUN yum install ncurses -y

#Set timezone to kst
RUN ln -sf /usr/share/zoneinfo/Asia/Seoul /etc/localtime

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
WORKDIR /root

# Copy init.sh : hidden file
# Copy entrypoint.sh to /usr/bin to execute interatively
COPY /shell /usr/bin
# Grant permission to shell file
RUN chmod +x /usr/bin/entrypoint.sh

# Export VOLUME
VOLUME ["/root"]
# Expose ssh
EXPOSE 22