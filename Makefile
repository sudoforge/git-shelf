PREFIX ?= /usr
BINPREFIX ?= "$(PREFIX)/bin"

BINS=$(wildcard bin/git-*)
COMMANDS = $(subst bin/, , $(BINS))

default: install

install:
	@mkdir -p $(DESTDIR)$(BINPREFIX)
	@$(foreach COMMAND, $(COMMANDS), \
		echo "... installing $(COMMAND) to $(DESTDIR)$(BINPREFIX)/$(COMMAND)"; \
		install -Dm755 "./bin/$(COMMAND)" "$(DESTDIR)$(BINPREFIX)/$(COMMAND)"; \
	)

.PHONY: default install
