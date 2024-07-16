DCOMPOSE=docker-compose
DSERVICE=base

.PHONY = all default transient isolated exposed

all: default

exposed: override DFLAGS += -v ${HOME}:/home/${USER}
exposed: default

transient: override DFLAGS += --rm
transient: default

default: override DFLAGS += -v /tmp:/tmp
default: isolated

isolated:
	$(DCOMPOSE) run $(DFLAGS) $(if $(DNAME),--name $(DNAME),) $(DSERVICE)
