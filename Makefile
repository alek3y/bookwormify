COMPOSE=docker-compose
SERVICE=bookwormify

.PHONY = all run exposed

all: run
run:
	$(COMPOSE) run $(SERVICE)
exposed:
	$(COMPOSE) run -v ${HOME}:/home/${USER} -v /tmp:/tmp/host $(SERVICE)
