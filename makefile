SHELL    := /bin/bash
SCRIPTS_DIR  = $(CURDIR)/scripts

.PHONY: help link cmdtool homebrew mac-setup brew pip emacs update

cmdtool:
	@source $(SCRIPTS_DIR)/cmd-line-tool.sh;

link:
	@source $(SCRIPTS_DIR)/link.sh;

homebrew:
	@source $(SCRIPTS_DIR)/homebrew.sh;

shell: homebrew
	@source $(SCRIPTS_DIR)/shell.sh;

mac-setup: cmdtool link homebrew shell
	@exec zsh;

brew: homebrew
	@source $(SCRIPTS_DIR)/brew.sh;

pip:
	@source $(SCRIPTS_DIR)/pip.sh;

pnpm:
	@source $(SCRIPTS_DIR)/pnpm.sh;

update: brew pip pnpm
	@echo "Update brew, pip, pnpm...";

hist:
	@source $(SCRIPTS_DIR)/hist.sh;

emacs:
	@source $(SCRIPTS_DIR)/emacs.sh;

help::
	$(info make cmdtool      = check cmd-line-tool for MacOS)
	$(info make homebrew     = check homebrew for MacOS)
	$(info make shell        = check bash, zsh for MacOS)
	$(info make link         = check link source to target)
	$(info make mac-setup    = check cmd-line-tool, homebrew and shell for MacOS)
	$(info make brew         = install or dump package according to Brewfile)
	$(info make pip          = install or freeze package according to requirements.txt)
	$(info make update       = update brew, pip, pnpm package info)
	$(info make hist         = backup or restore zsh history)
	$(info make emacs        = bootstrap emacs)
	@true
