IMAGE_NAME ?= vanities/pi
IMAGE_VERSION ?= latest
DOCKER_TAG := $(IMAGE_NAME):$(IMAGE_VERSION)
DOT_DIR ?= config
DOCKER_PATH = docker-compose.yml
DOCKER_COMPOSE = docker-compose --file $(DOCKER_PATH)

image:
	$(DOCKER_COMPOSE) build

up: image
	$(DOCKER_COMPOSE) up

down: 
	 $(DOCKER_COMPOSE) down

default: image
