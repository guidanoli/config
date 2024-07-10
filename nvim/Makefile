# Installs NeoVim and plugin dependencies, and links configuration files

SHARE_DIR=~/.local/share/nvim
CONFIG_DIR=~/.config/nvim
CURRENT_DIR=$(shell pwd)

.PHONY: install
install: install-neovim install-plugin-deps link-init link-plugins

.PHONY: install-neovim
install-neovim:
	apt-get satisfy -y --no-install-recommends \
		"neovim (>= 0.8.0)"

.PHONY: install-plugin-deps
install-plugin-deps:
	apt-get satisfy -y --no-install-recommends \
		"git (>= 2.19.0)"

.PHONY: link-init
link-init: ${CONFIG_DIR}/init.lua

${CONFIG_DIR}/init.lua: ${CONFIG_DIR}
	ln -s "${CURRENT_DIR}/init.lua" $@

${CONFIG_DIR}:
	mkdir -p $@

.PHONY: link-plugins
link-plugins: ${CONFIG_DIR}/lua/plugins.lua

${CONFIG_DIR}/lua/plugins.lua: ${CONFIG_DIR}/lua
	ln -s "${CURRENT_DIR}/lua/plugins.lua" $@

${CONFIG_DIR}/lua:
	mkdir -p $@

.PHONY: clean
clean:
	rm -rf ${SHARE_DIR} ${CONFIG_DIR}
