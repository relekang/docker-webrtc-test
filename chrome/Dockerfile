FROM ubuntu:14.04

RUN echo deb http://security.ubuntu.com/ubuntu trusty-security main restricted >> /etc/apt/sources.list
RUN echo deb-src http://security.ubuntu.com/ubuntu trusty-security main restricted >> /etc/apt/sources.list
RUN echo deb http://security.ubuntu.com/ubuntu trusty-security universe >> /etc/apt/sources.list
RUN echo deb-src http://security.ubuntu.com/ubuntu trusty-security universe >> /etc/apt/sources.list
RUN echo deb http://security.ubuntu.com/ubuntu trusty-security multiverse >> /etc/apt/sources.list
RUN echo deb-src http://security.ubuntu.com/ubuntu trusty-security multiverse >> /etc/apt/sources.list

RUN apt-get update && apt-get install -y -q wget unzip dpkg libnss3-1d curl make
RUN wget --no-check-certificate -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add -
ADD http://chromedriver.storage.googleapis.com/2.13/chromedriver_linux64.zip /srv/
RUN unzip /srv/chromedriver_linux64.zip -d /srv
RUN echo deb http://dl.google.com/linux/chrome/deb/ stable main >> /etc/apt/sources.list.d/google-chrome.list
RUN curl -sL https://deb.nodesource.com/setup | sudo bash -
RUN apt-get update && apt-get install -q -y openjdk-7-jre-headless google-chrome-stable xvfb openssh-server x11-xkb-utils xfonts-100dpi xfonts-75dpi xfonts-scalable xfonts-cyrillic nodejs chromium-chromedriver

RUN wget -N http://chromedriver.storage.googleapis.com/2.9/chromedriver_linux64.zip && unzip chromedriver_linux64.zip
RUN sudo mv -f chromedriver /usr/local/share/chromedriver
RUN chmod +x /usr/local/share/chromedriver
RUN sudo ln -s /usr/local/share/chromedriver /usr/local/bin/chromedriver && sudo ln -s /usr/local/share/chromedriver /usr/bin/chromedriver


RUN mkdir -p /opt/selenium/
RUN cd /opt/selenium/ && npm install selenium-webdriver bluebird
ADD upstart.sh /opt/selenium/upstart
ADD runner.js /opt/selenium/runner.js
RUN chmod +x /opt/selenium/upstart
RUN ln -s /opt/selenium/upstart /usr/local/bin/start-test
