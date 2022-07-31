FROM snreloaded/runstart:latest

RUN apt-get -y --no-install-recommends install gnupg2

# Add Adoptium repo for Temurin JDK (new source for OpenJDK)
RUN wget -O adoptium_gpg.key https://packages.adoptium.net/artifactory/api/gpg/key/public
RUN gpg -o /etc/apt/trusted.gpg.d/adoptium_gpg.key --dearmour adoptium_gpg.key
RUN rm adoptium_gpg.key
RUN echo "deb https://packages.adoptium.net/artifactory/deb $(awk -F= '/^VERSION_CODENAME/{print$2}' /etc/os-release) main" | tee /etc/apt/sources.list.d/adoptium.list
RUN apt-get -y update
RUN apt-get -y --no-install-recommends install temurin-17-jdk