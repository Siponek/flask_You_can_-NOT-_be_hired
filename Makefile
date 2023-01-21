#
#? Settings
#
VENV_PATH := $(CURDIR)/venv
VENV_ACTIVATE_PATH := $(VENV_PATH)/bin/activate

.PHONY: .ONESHELL
.ONESHELL:

#
#? Python
#
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
	docker compose --env-file docker.env up

.PHONY: build
build:
	docker compose --env-file docker.env build

.PHONY: down
down:
	docker compose down

.PHONY: clean
clean:
	docker compose down --remove-orphans --volumes

