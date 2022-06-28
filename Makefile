SHELL := /usr/bin/env bash

install:
	@echo starting DeathVim installer
	bash ./utils/installer/install.sh

install-bin:
	@echo starting DeathVim bin-installer
	bash ./utils/installer/install_bin.sh

install-neovim-binary:
	@echo installing Neovim from github releases
	bash ./utils/installer/install-neovim-from-release

uninstall:
	@echo starting DeathVim uninstaller
	bash ./utils/installer/uninstall.sh

.PHONY: install install-neovim-binary uninstall lint style test
