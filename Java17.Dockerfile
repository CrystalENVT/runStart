FROM snreloaded/runstart:base-REPLACEME

ENV JAVA_VERSION="17.0.12+7-1ubuntu2~24.04"

RUN apt-get -y --no-install-recommends install openjdk-17-jre-headless=${JAVA_VERSION}
