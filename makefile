SHELL	   := /bin/bash
BASE_DIR    = $(CURDIR)
TOOL_DIR    = $(BASE_DIR)/tool

.PHONY: help bootstrap link xcode homebrew brew pip nvim emacs 

bootstrap: xcode homebrew link
	@exec /usr/local/bin/zsh

xcode:
	@source $(TOOL_DIR)/xcode.sh

homebrew:
	@source $(TOOL_DIR)/homebrew.sh

shell:
	@source $(TOOL_DIR)/shell.sh

link: shell
	@/usr/local/bin/bash $(TOOL_DIR)/link.sh;

brew: homebrew
	@$(TOOL_DIR)/brew.sh macos/Brewfile

pip:
	@$(TOOL_DIR)/pip.sh ~/.tmp/requirements.txt

npm:
	@$(TOOL_DIR)/npm.sh ~/.tmp/Npmfile

nvim:
	@source $(TOOL_DIR)/nvim.sh

emacs:
	@source $(TOOL_DIR)/emacs.sh

help::
	$(info make bootstrap    = check xcode, homebrew and shell for MacOS)
	$(info make xcode        = check xcode for MacOS)
	$(info make homebrew     = check homebrew for MacOS)
	$(info make shell        = check bash, zsh for MacOS)
	$(info make link         = check link source to target)
	$(info make brew         = install or dump package according to Brewfile)
	$(info make npm          = install or dump package according to Npmfile)
	$(info make pip          = install or freeze package according to requirements.txt)
	$(info make nvim         = bootstrap neovim)
	$(info make emacs        = bootstrap emacs)
	@true
