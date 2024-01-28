SHELL	   := /bin/bash
BASE_DIR    = $(CURDIR)
TOOL_DIR    = $(BASE_DIR)/tool

.PHONY: help bootstrap link cmd-line-tool homebrew brew pip nvim emacs update

cmd-line-toool:
	@source $(TOOL_DIR)/cmd-line-tool.sh

homebrew:
	@source $(TOOL_DIR)/homebrew.sh

shell:
	@source $(TOOL_DIR)/shell.sh

link: shell
	@/usr/local/bin/bash $(TOOL_DIR)/link.sh;

bootstrap: cmd-line-tool homebrew link
	@exec /usr/local/bin/zsh

brew: homebrew
	@source $(TOOL_DIR)/brew.sh

pip:
	@source $(TOOL_DIR)/pip.sh

pnpm:
	@source $(TOOL_DIR)/pnpm.sh

update: brew pip pnpm
	@echo "Update brew, pip, pnpm..."

hist:
	@source $(TOOL_DIR)/hist.sh

nvim:
	@source $(TOOL_DIR)/nvim.sh

emacs:
	@source $(TOOL_DIR)/emacs.sh

help::
	$(info make cmdlinetool  = check cmd-line-tool for MacOS)
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
