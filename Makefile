## Portainer Makefile.
## Used with dcape at ../../
#:

SHELL                 = /bin/bash
CFG                  ?= .env

# Docker image version tested for actual dcape release
PORTAINER_VER0       ?= 2.19.4-alpine

#- ******************************************************************************
#- Portainer config

#- Portainer hostname
PORTAINER_HOST       ?= port.$(DCAPE_DOMAIN)

#- Docker image
PORTAINER_IMAGE      ?= portainer/portainer-ce
#- Docker image version
PORTAINER_VER        ?= $(PORTAINER_VER0)

#- dcape root directory
DCAPE_ROOT           ?= $(DCAPE_ROOT)

# ------------------------------------------------------------------------------

-include $(CFG)
export

ifdef DCAPE_STACK
include $(DCAPE_ROOT)/Makefile.dcape
else
include $(DCAPE_ROOT)/Makefile.app
endif

# ------------------------------------------------------------------------------

# check app version
init:
	@if [[ "$$PORTAINER_VER0" != "$$PORTAINER_VER" ]] ; then \
	  echo "Warning: PORTAINER_VER in dcape ($$PORTAINER_VER0) differs from yours ($$PORTAINER_VER)" ; \
	fi
	@echo "  URL: $(DCAPE_SCHEME)://$(PORTAINER_HOST)"
