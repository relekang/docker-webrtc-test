TAG ?= webrtc-browser-test
LINE = --------------------------------------------------

build:
	@echo "Building docker image with tag $(TAG)"
	@echo $(LINE)
	@docker build -t $(TAG) .
	@touch .build

.build:
	@make build
	@echo $(LINE)


run: .build
	@echo "Starting docker container with tag $(TAG)"
	@echo $(LINE)
	@docker run --privileged=true -Pt webrtc-browser-test &

stopall:
	@echo "Stopping all containers"
	@echo $(LINE)
	@docker stop $(shell docker ps -a -q)

clean:
	@rm -rf .build
	@echo "Cleaned up"

.PHONY: build run stopall clean
