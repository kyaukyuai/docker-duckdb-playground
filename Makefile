.DEFAULT_GOAL := run

DUCKDB_VERSION=0.9.1
IMAGE_NAME := kyaukyuai/duckdb:$(DUCKDB_VERSION)
LATEST_IMAGE_NAME := kyaukyuai/duckdb:latest
COMMAND := /bin/bash

build:
	@docker build --build-arg DUCKDB_VERSION=$(DUCKDB_VERSION) -t $(IMAGE_NAME) -t $(LATEST_IMAGE_NAME) .

run:
	@docker run --rm -it $(IMAGE_NAME) $(COMMAND)

push: build
	docker push $(IMAGE_NAME)
	docker push $(LATEST_IMAGE_NAME)
