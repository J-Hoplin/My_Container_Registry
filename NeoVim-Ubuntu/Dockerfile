FROM ubuntu:rolling

LABEL maintainer="Hoplin"

COPY ./setting.sh .

RUN bash setting.sh

# RUN apt-get update -y\
#     && apt-get upgrade -y\
#     && apt-get install git vim\
#     && apt-get install software-properties-common -y\
#     && apt-get -y install universal-ctags\
#     && add-apt-repository ppa:neovim-ppa/stable -y\
#     && apt-get update -y\
#     && apt-get install neovim -y\
#     && apt-get install curl -y\
#     && curl -sL https://deb.nodesource.com/setup_18.x | bash -\
#     && apt-get install nodejs -y\
#     && apt-get install build-essential -y\
#     && npm install -g yarn\
#     && yarn\
#     && apt-get install python3-dev python3-pip -y\
#     && pip3 install python-language-server==0.20.0\
#     && pip3 install --user pynvim\
#     && pip3 install pylint
