COMPOSE_FILE = srcs/docker-compose.yml
export COMPOSE_FILE

VLM_FOLDER = /home/edarnand/data
VLM_MARIADB = $(VLM_FOLDER)/mariadb
VLM_WORDPRESS = $(VLM_FOLDER)/wordpress

all: build
	docker compose up --detach

build: $(VLM_WORDPRESS) $(VLM_MARIADB)
	docker compose build

$(VLM_WORDPRESS):
	mkdir -p $(VLM_WORDPRESS)

$(VLM_MARIADB):
	mkdir -p $(VLM_MARIADB)

clean:
	docker compose down
	
fclean: clean
	docker volume rm mariadb wordpress
	sudo rm -rf $(VLM_FOLDER) 
	docker system prune -af

log:
	docker compose logs

ps:
	docker compose ps -a

.PHONY: all build volume clean fclean log ps
