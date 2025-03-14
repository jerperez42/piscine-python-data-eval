NAME=piscine-python-eval

all:
	docker build --no-cache -t ${NAME} .
	docker run --name ${NAME} -d ${NAME}

status:
	docker ps
	docker volume ls
	docker image ls
	docker image ls
	docker network ls

rm:
	@echo "Stoping dockers and removing everything"
	-docker stop $$(docker ps -qa) 2>/dev/null
	-docker rm $$(docker ps -qa) 2>/dev/null
	-docker rmi -f $$(docker images -qa) 2>/dev/null
	-docker volume rm $$(docker volume ls -q) 2>/dev/null
	-docker network rm $$(docker network ls -q) 2>/dev/null

exec:
	docker exec -it ${NAME} /bin/bash || true

re: rm all

.phony: all status rm exec re
