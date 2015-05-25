# docker-webrtc-test
A headless browser Docker setup for testing webrtc. This repo contains two Dockerfiles one for each of the 
browsers Firefox and Chrome. Both is automatically built on the Docker registry, see links below. Both 
images installs the latest stable version of the given browser and has a script called `start-test`, from
which the browser is started with selenium.

* [Chrome](https://registry.hub.docker.com/u/relekang/chrome-webrtc) [Dockerfile](chrome/Dockerfile)
* [Firefox](https://registry.hub.docker.com/u/relekang/firefox-webrtc) [Dockerfile](firefox/Dockerfile)

## Usage
Both Docker images takes two parameters: an url and a time-to-live. The browser will visit the web page for the
given amount of time. The page must contain an hidden element with the css selector `#done`. Making that element
visible will make selenium quit the browser.

Example run(with image from Docker registry):

```bash
# Chrome
docker run  -P --net=host -d relekang/chrome-webrtc start-test http://example.com 3600

# Firefox
docker run  -P --net=host -d relekang/firefox-webrtc start-test http://example.com 3600
```

This browser will run for an hour or until the element with the css selector `#done` is visible.

The `-P` `--net=host` is important to avoid symmetrical NAT between two hosts which would make
it required to have a TURN server to make the peers communicate. Also, leaving them out is a
great way to test that you support symmetrical NAT.

----------------------

MIT © Rolf Erik Lekang
