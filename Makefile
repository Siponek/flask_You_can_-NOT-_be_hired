# .ONESHELL:
.PHONY: flask
flask:
	@set FLASK_APP = 'C:\Users\szink\OneDrive\Pulpit\Programming_projects\js\cipcip\apka\flask_host.py';
	@set FLASK_ENV = 'development';
	@echo %FLASK_APP%;
	@echo %FLASK_ENV%;
	flask --debug run --host=0.0.0.0 --port=8000 
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