FROM snreloaded/runstart:base-REPLACEME

# install several "runner" tools
RUN apt-get -y --no-install-recommends install python3-pip=24.0+dfsg-1ubuntu1
RUN apt-get -y --no-install-recommends install python3.12=3.12.3-1ubuntu0.2

# set python3 as python binary
RUN ln -s /usr/bin/python3 /usr/bin/python
