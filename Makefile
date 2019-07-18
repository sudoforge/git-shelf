PREFIX ?= /usr
BINPREFIX ?= "$(PREFIX)/bin"

BINS=$(wildcard bin/git-*)
COMMANDS = $(subst bin/, , $(BINS))

.PHONY: default
default: install

.PHONY: install
install:
	@mkdir -p $(DESTDIR)$(BINPREFIX)
	@$(foreach COMMAND, $(COMMANDS), \
		echo "... installing $(COMMAND) to $(DESTDIR)$(BINPREFIX)/$(COMMAND)"; \
		install -m755 "./bin/$(COMMAND)" "$(DESTDIR)$(BINPREFIX)/$(COMMAND)"; \
	)
