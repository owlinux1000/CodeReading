FROM ubuntu:18.04

LABEL maintainer="encry1024@gmail.com"

RUN apt update -y && apt upgrade -y \
    gcc make wget libncurses5-dev apache2 exuberant-ctags

# Build GNU global
RUN wget https://ftp.gnu.org/pub/gnu/global/global-6.6.3.tar.gz -O /usr/local/src/global-6.6.3.tar.gz && tar -xvf /usr/local/src/global-6.6.3.tar.gz -C /usr/local/src && rm /usr/local/src/global-6.6.3.tar.gz
WORKDIR /usr/local/src/global-6.6.3
RUN ./configure && make && make install
WORKDIR /usr/local/src

# Setup apache2
ADD alias.conf /etc/apache2/mods-available/alias.conf
RUN a2enmod cgi

EXPOSE 8888

ENTRYPOINT ["apache2ctl", "-D", "FOREGROUND"]
