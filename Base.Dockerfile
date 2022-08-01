FROM ubuntu:latest

# [optional] variable SRC_ARCHIVE_URL -> archive to download in container for running
# [optional] volume mounting for persistance -> /local/path/to/dir:/mnt

WORKDIR /runstart

# helper tools
RUN apt-get -y update
# --no-install-recommends needs to be removed from the atool install,
#   otherwise the various archive formats are not included
#   recommends list: https://packages.ubuntu.com/jammy/atool
RUN apt-get -y install atool
RUN apt-get -y --no-install-recommends install grep
# --no-install-recommends needs to be removed from the wget install,
#   otherwise the adoptium key can't get downloaded.
#   "ca-certificates" is a recommeds package: https://packages.ubuntu.com/jammy/wget
RUN apt-get -y install wget

COPY ./setup.sh .
RUN chmod +x setup.sh

CMD ["/runstart/setup.sh"]