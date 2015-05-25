# docker-webrtc-test
A headless browser docker setup for testing webrtc

## Usage
Both Docker images takes two parameters: an url and a time-to-live. The browser will visit the web page for the
given amount of time. The page must contain an hidden element with the css selector `#done`. Making that element
visible will make selenium quit the browser.

Example run(with image from Docker registry):

```
docker run  -P --net=host -d relekang/firefox-webrtc start-test http://example.com 3600
```

This browser will run for an hour or until the element with the css selector `#done` is visible.

The `-P` `--net=host` is important to avoid symmetrical NAT between two hosts which would make
it required to have a TURN server to make the peers communicate. Also, leaving them out is a
great way to test that you support symmetrical NAT.

----------------------

MIT © Rolf Erik Lekang
