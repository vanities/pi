IMAGE_NAME ?= vanities/pi
IMAGE_VERSION ?= latest
DOCKER_TAG := $(IMAGE_NAME):$(IMAGE_VERSION)

DOCKER_PATH = docker-compose.yml

# apps
PI_HOLE := pihole/$(DOCKER_PATH)
UNBOUND := unbound/$(DOCKER_PATH)
WIREGUARD := wireguard/$(DOCKER_PATH)

# someday.. when arm works
SUBSPACE := wireguard/subspace/$(DOCKER_PATH)
WIREGUARD_UI := wireguard/ui/$(DOCKER_PATH)

DOCKER_COMPOSE = docker-compose \
				 --file $(WIREGUARD) \
				 #--file $(UNBOUND) \
				 --file $(PI_HOLE) \

# env vars
PIHOLE_WEB_PASSWORD ?= password
PIHOLE_TIMEZONE ?= America/Chicago


new: ufw up

image:
	$(DOCKER_COMPOSE) build

bash:
	$(DOCKER_COMPOSE) run --rm wireguard ash

up: image
	$(DOCKER_COMPOSE) up

release: image
	docker push $(DOCKER_TAG)

down: 
	 $(DOCKER_COMPOSE) down

install_terraria:
	./terraria/bin/install


default: image
