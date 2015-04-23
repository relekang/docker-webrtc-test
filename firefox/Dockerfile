FROM ubuntu:14.04

RUN apt-get -y update && \
    apt-get install -y -q build-essential software-properties-common wget unzip dpkg libnss3-1d curl make
RUN add-apt-repository -y ppa:chris-lea/node.js
RUN apt-get update -y && \
    apt-get install -y -q \
        python \
        python-dev \
        firefox \
        openjdk-7-jre-headless \
        nodejs \
        x11vnc \
        xvfb \
        xfonts-100dpi \
        xfonts-75dpi \
        xfonts-scalable \
        xfonts-cyrillic

RUN mkdir -p /opt/selenium/
RUN cd /opt/selenium/ && npm install selenium-webdriver firefox-profile bluebird
ADD upstart.sh /opt/selenium/upstart
ADD runner.js /opt/selenium/runner.js
RUN chmod +x /opt/selenium/upstart
RUN ln -s /opt/selenium/upstart /usr/local/bin/start-test
