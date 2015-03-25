TAG ?= webrtc-browser-test
LINE = --------------------------------------------------

build:
	@echo "Building docker image with tag $(TAG)"
	@echo $(LINE)
	@docker build -t $(TAG) .

run:
	@echo "Starting docker container with tag $(TAG)"
	@echo $(LINE)
	@docker run -Pt webrtc-browser-test

stopall:
	@echo "Stopping all containers"
	@echo $(LINE)
	@docker stop $(shell docker ps -a -q)
