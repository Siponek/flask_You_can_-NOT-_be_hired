#
#? Settings and Variables (Works for windows 11)
#? CURDIR is the directory of the Makefile, even if it is called from a subdirectory with make -C
#
ENV_FILE := $(CURDIR)/env/flask.env
DOCKER_COMPOSE_FILE := $(CURDIR)/docker/docker-compose.yaml
DOCKER_FLAGS := --file $(DOCKER_COMPOSE_FILE) --env-file $(ENV_FILE)
DOCKER_COMPOSE := docker compose $(DOCKER_FLAGS)


.PHONY: .ONESHELL
.ONESHELL:

.PHONY: flask
flask:
	python ./apka/flask_host.py

.PHONY: up
up:
	$(DOCKER_COMPOSE) up

.PHONY: build
build:
	$(DOCKER_COMPOSE) build

.PHONY: down
down:
	$(DOCKER_COMPOSE) down

.PHONY: clean
clean:
	$(DOCKER_COMPOSE) down --remove-orphans --volumes

