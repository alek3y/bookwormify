COMPOSE=docker-compose
SERVICE=base

.PHONY = all run exposed

all: run
run:
	$(COMPOSE) run $(SERVICE)
exposed:
	$(COMPOSE) run -v ${HOME}:/home/${USER} -v /tmp:/tmp/host $(SERVICE)
