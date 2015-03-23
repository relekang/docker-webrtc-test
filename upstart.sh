cd /opt/selenium/ && npm install selenium-webdriver
npm install -g selenium-standalone && \
    selenium-standalone install && \
    selenium-standalone start &


Xvfb :10 -screen 0 1366x768x24 -ac -extension RANDR &

#nohup java -jar /usr/local/bin/selenium-server-standalone-2.35.0.jar &
/usr/sbin/sshd -D
