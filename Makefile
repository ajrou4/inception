name = inception

all:
	@mkdir -p /home/majrou/data
	@mkdir -p /home/majrou/data/mariadb
	@mkdir -p /home/majrou/data/wordpress
	@docker-compose -f ./srcs/docker-compose.yml --env-file srcs/.env up -d

build:
	@bash srcs/requirements/wordpress/tools/make_dir.sh
	@docker-compose -f ./srcs/docker-compose.yml --env-file srcs/.env up -d --build

down:
	@docker-compose -f ./srcs/docker-compose.yml --env-file srcs/.env down

re: down
	@docker-compose -f ./srcs/docker-compose.yml --env-file srcs/.env up -d --build

clean: down
	@docker system prune -a -f
	@sudo rm -rf /home/majrou/data/wordpress/*
	@sudo rm -rf /home/majrou/data/mariadb/*

fclean:
	@docker stop $(shell docker ps -qa)
	@docker system prune --all --force --volumes
	@docker network prune --force
	@docker volume prune --force
	@sudo rm -rf /home/majrou/data/wordpress/*
	@sudo rm -rf /home/majrou/data/mariadb/*

.PHONY : all build down re clean fclean
