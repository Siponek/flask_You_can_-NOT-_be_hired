#
#? Settings and Variables (Works for windows 11)
#? CURDIR is the directory of the Makefile, even if it is called from a subdirectory with make -C
#
VENV_PATH := $(CURDIR)/venv
VENV_ACTIVATE_PATH := $(VENV_PATH)/bin/activate
DOCKER_COMPOSE_FILE := $(CURDIR)/docker/docker-compose.yaml
ENV_FILE := $(CURDIR)/env/docker.env
DOCKER_FLAGS := --file $(DOCKER_COMPOSE_FILE) --env-file $(ENV_FILE)
DOCKER_COMPOSE := docker compose $(DOCKER_FLAGS)

.PHONY: print
print:
	@echo "CURDIR" $(CURDIR)
	@echo "@D" $(@D)
	@echo "@F" $(@F)
	@echo "@" $(@)
	@echo "%" $(%)
	@echo "%D" $(%D)

.PHONY: .ONESHELL
.ONESHELL:

#
#? Python
#
.PHONY: local-dev
local-dev: update-venv
	npm install

.PHONY: update-venv
update-venv: venv
	python -m pip install --upgrade pip
	python -m pip install -r requirements.txt

.PHONY: venv
venv:
	python -m venv $(VENV_PATH)
	$(MAKE) update-venv

#
#? Docker
#
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

