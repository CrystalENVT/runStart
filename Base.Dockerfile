FROM ubuntu:noble-20240801

# [optional] variable SRC_ARCHIVE_URL -> archive to download in container for running
# [optional] volume mounting for persistance -> /local/path/to/dir:/mnt

ENV ATOOL_VERSION="0.39.0-14"
ENV GREP_VERSION="3.11-4build1"
ENV WGET_VERSION="1.21.4-1ubuntu4.1"

WORKDIR /runstart

# helper tools
RUN apt-get -y update
# --no-install-recommends needs to be removed from the atool install,
#   otherwise the various archive formats are not included
#   recommends list: https://packages.ubuntu.com/jammy/atool
RUN apt-get -y install atool=${ATOOL_VERSION}
RUN apt-get -y --no-install-recommends install grep=${GREP_VERSION}
# --no-install-recommends needs to be removed from the wget install,
#   otherwise the adoptium key can't get downloaded.
#   "ca-certificates" is a recommeds package: https://packages.ubuntu.com/jammy/wget
RUN apt-get -y install wget=${WGET_VERSION}

COPY ./setup.sh .
RUN chmod +x setup.sh

CMD ["/runstart/setup.sh"]
