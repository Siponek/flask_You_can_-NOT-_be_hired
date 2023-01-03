
.PHONY: .ONESHELL
.ONESHELL:

.PHONY: flask
flask:
	python ./apka/flask_host.py

.PHONY: up
up:
	docker compose up
.PHONY: build
build:
	docker compose build

.PHONY: run
run:
	docker compose run 

.PHONY: down
down:
	docker compose down
.PHONY: clean
clean:
	docker compose down --remove-orphans --volumes

