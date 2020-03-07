IMAGE_NAME ?= vanities/pi
IMAGE_VERSION ?= latest
DOCKER_TAG := $(IMAGE_NAME):$(IMAGE_VERSION)

DOCKER_PATH = docker-compose.yml

# apps
PI_HOLE := pihole/$(DOCKER_PATH)
WIREGUARD := wireguard/$(DOCKER_PATH)

# someday.. when arm works
SUBSPACE := wireguard/subspace/$(DOCKER_PATH)
WIREGUARD_UI := wireguard/ui/$(DOCKER_PATH)

DOCKER_COMPOSE = docker-compose \
				 --file $(PI_HOLE) \
				 --file $(WIREGUARD)

new: ufw up

image:
	$(DOCKER_COMPOSE) build

shell:
	 ssh -i $(EC2_PRIVATE_KEY_PATH) $(EC2_URL)

up: image
	$(DOCKER_COMPOSE) up

release: image
	docker push $(DOCKER_TAG)

down: 
	 $(DOCKER_COMPOSE) down

default: image
