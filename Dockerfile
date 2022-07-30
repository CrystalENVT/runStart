FROM ubuntu:latest

# [optional] variable SRC_ARCHIVE_URL -> archive to download in container for running
# [optional] volume mounting for persistance -> /local/path/to/dir:/mnt

WORKDIR /runstart

# helper tools
RUN apt-get -y update
RUN apt-get -y install atool
RUN apt-get -y install gnupg2
RUN apt-get -y install grep
RUN apt-get -y install wget

# Add Adoptium repo for Temurin JDK (new source for OpenJDK)
RUN wget -O adoptium_gpg.key https://packages.adoptium.net/artifactory/api/gpg/key/public
RUN apt-key add adoptium_gpg.key
RUN rm adoptium_gpg.key
RUN echo "deb https://packages.adoptium.net/artifactory/deb $(awk -F= '/^VERSION_CODENAME/{print$2}' /etc/os-release) main" | tee /etc/apt/sources.list.d/adoptium.list
RUN apt-get -y update

# install several "runner" tools
RUN apt-get -y install pip
RUN apt-get -y install python3
RUN apt-get -y install temurin-17-jdk

# set python3 as python binary
RUN ln -s /usr/bin/python3 /usr/bin/python

COPY ./setup.sh .
RUN chmod +x setup.sh

CMD ["/runstart/setup.sh"]