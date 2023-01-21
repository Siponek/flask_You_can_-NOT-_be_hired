
.PHONY: .ONESHELL
.ONESHELL:

.PHONY: flask
flask:
	python ./apka/flask_host.py

.PHONY: up
up:
	docker compose --env-file docker.env up
.PHONY: build
build:
	docker compose --env-file docker.env build

.PHONY: run
run:
	docker compose run 

.PHONY: down
down:
	docker compose down
.PHONY: clean
clean:
	docker compose down --remove-orphans --volumes

