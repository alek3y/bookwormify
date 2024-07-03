COMPOSE=docker-compose
SERVICE=base

.PHONY = all default transient isolated exposed

all: default

exposed: DFLAGS += -v ${HOME}:/home/${USER}
exposed: default

transient: DFLAGS += --rm
transient: default

default: DFLAGS += -v /tmp:/tmp
default: isolated

isolated:
	$(COMPOSE) run $(DFLAGS) $(SERVICE)
