FROM crystalenvt/runstart:base-REPLACEME

# install several "runner" tools
RUN apt-get -y --no-install-recommends install python3-pip
RUN apt-get -y --no-install-recommends install python3.12

# set python3 as python binary
RUN ln -s /usr/bin/python3 /usr/bin/python
