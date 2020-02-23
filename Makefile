IMAGE_NAME ?= vanities/pi
IMAGE_VERSION ?= latest
DOCKER_TAG := $(IMAGE_NAME):$(IMAGE_VERSION)
DOT_DIR ?= config
DOCKER_PATH = docker-compose.yml
DOCKER_COMPOSE = docker-compose --file $(DOCKER_PATH)

image:
	$(DOCKER_COMPOSE) build --tag $(DOCKER_TAG)

run: image
	$(DOCKER_COMPOSE) up

release: image
	docker push $(DOCKER_TAG)

down: 
	 $(DOCKER_COMPOSE) down

default: image
