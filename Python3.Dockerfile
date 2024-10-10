FROM snreloaded/runstart:base-REPLACEME

ENV PIP_VERSION="24.0+dfsg-1ubuntu1"
ENV PYTHON_VERSION="3.12.3-1ubuntu0.2"

# install several "runner" tools
RUN apt-get -y --no-install-recommends install python3-pip="${PIP_VERSION}"
RUN apt-get -y --no-install-recommends install python3.12="${PYTHON_VERSION}"

# set python3 as python binary
RUN ln -s /usr/bin/python3 /usr/bin/python
