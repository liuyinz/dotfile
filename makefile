SHELL    := /bin/bash
SCRIPTS_DIR  = $(CURDIR)/scripts

.PHONY: help bootstrap link cmdtool homebrew brew pip nvim emacs update

cmdtool:
	@source $(SCRIPTS_DIR)/cmd-line-tool.sh

homebrew:
	@source $(SCRIPTS_DIR)/homebrew.sh

shell:
	@source $(SCRIPTS_DIR)/shell.sh

link: shell
	@/usr/local/bin/bash $(SCRIPTS_DIR)/link.sh;

bootstrap: cmdtool homebrew link
	@exec /usr/local/bin/zsh

brew: homebrew
	@source $(SCRIPTS_DIR)/brew.sh

pip:
	@source $(SCRIPTS_DIR)/pip.sh

pnpm:
	@source $(SCRIPTS_DIR)/pnpm.sh

update: brew pip pnpm
	@echo "Update brew, pip, pnpm..."

hist:
	@source $(SCRIPTS_DIR)/hist.sh

nvim:
	@source $(SCRIPTS_DIR)/nvim.sh

emacs:
	@source $(SCRIPTS_DIR)/emacs.sh

help::
	$(info make cmdtool      = check cmd-line-tool for MacOS)
	$(info make homebrew     = check homebrew for MacOS)
	$(info make shell        = check bash, zsh for MacOS)
	$(info make link         = check link source to target)
	$(info make bootstrap    = check cmd-line-tool, homebrew and shell for MacOS)
	$(info make brew         = install or dump package according to Brewfile)
	$(info make pip          = install or freeze package according to requirements.txt)
	$(info make update       = update brew, pip, npm package info)
	$(info make hist         = backup or restore zsh history)
	$(info make nvim         = bootstrap neovim)
	$(info make emacs        = bootstrap emacs)
	@true
