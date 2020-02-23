IMAGE_NAME ?= vanities/pi
IMAGE_VERSION ?= latest
DOCKER_TAG := $(IMAGE_NAME):$(IMAGE_VERSION)

DOCKER_PATH = docker-compose.yml
WEB_URL ?= catwebm.com
RIOT_POSTGRES_PASSWORD ?= some-pass

# apps
PI_HOLE := pihole/$(DOCKER_PATH)
SUBSPACE := wireguard/subspace/$(DOCKER_PATH)
WIREGUARD_UI := wireguard/ui/$(DOCKER_PATH)
RIOT := riot/$(DOCKER_PATH)

DOCKER_COMPOSE = docker-compose \
				 --file $(PI_HOLE) \
				 --file $(SUBSPACE) \
				 --file $(RIOT)

# init
DOCKER_INIT_PATH = docker-compose.init.yml
RIOT_INIT := riot/$(DOCKER_INIT_PATH)
DOCKER_COMPOSE_INIT = docker-compose \
					  --file $(RIOT_INIT)

image:
	$(DOCKER_COMPOSE) build

init:
	POSTGRES_PASSWORD=$(RIOT_POSTGRES_PASSWORD) \
	FQDN=$(WEB_URL) \
	  $(DOCKER_COMPOSE_INIT) up --detach
	riot/./renew-cert.sh $(WEB_URL)
	sed -e "s/server_name:.*/minary:$(WEB_URL)/g" riot/nginx.init.config > tmp
	mv -- tmp riot/nginx.init.conf/docker-compose.yml
	sed -e "s/server_name:.*/minary:$(WEB_URL)/g" riot/nginx.config > tmp
	mv -- tmp riot/nginx.conf/docker-compose.yml

up: image
	POSTGRES_PASSWORD=$(RIOT_POSTGRES_PASSWORD) \
	FQDN=$(WEB_URL) \
	  $(DOCKER_COMPOSE) up

release: image
	docker push $(DOCKER_TAG)

down: 
	 $(DOCKER_COMPOSE) down

default: image
