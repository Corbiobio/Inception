COMPOSE_FILE = srcs/docker-compose.yml
export COMPOSE_FILE

all: build
	docker compose up --detach

build: volume
	docker compose build

volume:
	mkdir -p /home/edarnand/data

clean:
	docker compose down
	docker system prune -af

fclean: clean
	rm -rf /home/edarnand/data 

.PHONY: prune
