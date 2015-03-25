FROM ubuntu:14.04

RUN apt-get update && apt-get -y install curl
RUN curl -sL https://deb.nodesource.com/setup | sudo bash -
RUN apt-get update && \
    apt-get -y install openjdk-7-jre \
                       build-essential \
                       chromium-browser \
                       firefox \
                       x11-xkb-utils \
                       xfonts-100dpi \
                       xfonts-75dpi \
                       xfonts-scalable \
                       xserver-xorg-core \
                       dbus-x11 \
                       xvfb \
                       unzip \
                       curl \
                       xfonts-cyrillic \
                       openssh-server \
                       nodejs

RUN mkdir /var/run/sshd
RUN echo 'root:hi' | chpasswd
RUN sed -i 's/PermitRootLogin without-password/PermitRootLogin yes/' /etc/ssh/sshd_config
RUN sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd
RUN echo "export VISIBLE=now" >> /etc/profile
RUN locale-gen en_US.UTF-8


RUN npm install -g selenium-standalone && selenium-standalone install

RUN mkdir -p /opt/selenium/
RUN cd /opt/selenium/ && npm install selenium-webdriver
ADD runner.js /opt/selenium/runner.js
ADD upstart.sh /opt/selenium/upstart.sh

EXPOSE 22
CMD ["sh", "/opt/selenium/upstart.sh"]
