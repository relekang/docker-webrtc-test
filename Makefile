TAG ?= webrtc-browser-test
LINE = --------------------------------------------------

build:
	@echo "Building docker image with tag $(TAG)"
	@echo $(LINE)
	@docker build -t $(TAG) .
	@touch .build

.build: build

run: .build
	@echo "Starting docker container with tag $(TAG)"
	@echo $(LINE)
	@docker run -Pt webrtc-browser-test

stopall: .build
	@echo "Stopping all containers"
	@echo $(LINE)
	@docker stop $(shell docker ps -a -q)

.PHONY: build run stopall
