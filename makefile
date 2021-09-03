all: up

prepare: 
	@echo "\n-----------------checking for depedencies------------------\n"
	@sudo apt-get update
	@sudo apt install -y docker.io
	@sudo apt install -y docker-compose
	@sudo systemctl enable --now docker

up: prepare
	@echo "\n------------------starting your container------------------\n"
	@#! /bin/bash
	@if [ ! -d docker ]; then\
		mkdir docker;\
		if [ ! -d www ]; then\
			cd docker ;\
			mkdir db ;\
			mkdir www && cd ../../ ;\
		fi ;\
	fi
	@sudo cp ./index.php ./docker/www/;
	@sudo docker-compose up -d --build
	@echo "\n------------------wating for 60 seconds--------------------\n"
	@sleep 60

teardown: down
	@echo "\n------------------removing your files----------------------\n"
	@sudo rm -rf ./docker

down:
	@echo "\n------------------stoping all services---------------------\n"
	@sudo docker-compose down
