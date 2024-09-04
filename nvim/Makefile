# Links NeoVim configuration files

SHARE_DIR=~/.local/share/nvim
CONFIG_DIR=~/.config/nvim
CURRENT_DIR=$(shell pwd)

.PHONY: install
install: link-init link-plugins

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
