cd /opt/selenium
selenium-standalone start & \
Xvfb :10 -screen 0 1366x768x24 -ac -extension RANDR & \
node runner.js & \
/usr/sbin/sshd -D
