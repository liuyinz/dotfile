SHELL	   := /bin/bash
BASE_DIR    = $(CURDIR)
TOOL_DIR    = $(BASE_DIR)/tool

.PHONY: help bootstrap link xcode homebrew brew pip nvim emacs update

xcode:
	@source $(TOOL_DIR)/xcode.sh

homebrew:
	@source $(TOOL_DIR)/homebrew.sh

shell:
	@source $(TOOL_DIR)/shell.sh

link: shell
	@/usr/local/bin/bash $(TOOL_DIR)/link.sh;

bootstrap: xcode homebrew link
	@exec /usr/local/bin/zsh

brew: homebrew
	@source $(TOOL_DIR)/brew.sh

pip:
	@source $(TOOL_DIR)/pip.sh

npm:
	@source $(TOOL_DIR)/npm.sh

pnpm:
	@source $(TOOL_DIR)/pnpm.sh

update: brew pip npm pnpm
	@echo "Update brew, pip, npm, pnpm..."

hist:
	@source $(TOOL_DIR)/hist.sh

nvim:
	@source $(TOOL_DIR)/nvim.sh

emacs:
	@source $(TOOL_DIR)/emacs.sh

help::
	$(info make xcode        = check xcode for MacOS)
	$(info make homebrew     = check homebrew for MacOS)
	$(info make shell        = check bash, zsh for MacOS)
	$(info make link         = check link source to target)
	$(info make bootstrap    = check xcode, homebrew and shell for MacOS)
	$(info make brew         = install or dump package according to Brewfile)
	$(info make pip          = install or freeze package according to requirements.txt)
	$(info make npm          = install or dump package according to Npmfile)
	$(info make update       = update brew, pip, npm package info)
	$(info make hist         = backup or restore zsh history)
	$(info make nvim         = bootstrap neovim)
	$(info make emacs        = bootstrap emacs)
	@true
