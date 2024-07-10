CONFIG_DIR=~/.config/nvim
CURRENT_DIR=$(shell pwd)

.PHONY: install
install: ${CONFIG_DIR}/init.lua ${CONFIG_DIR}/lua/plugins.lua

${CONFIG_DIR}:
	mkdir -p $@

${CONFIG_DIR}/init.lua: ${CONFIG_DIR}
	ln -s "${CURRENT_DIR}/init.lua" $@

${CONFIG_DIR}/lua:
	mkdir -p $@

${CONFIG_DIR}/lua/plugins.lua: ${CONFIG_DIR}/lua
	ln -s "${CURRENT_DIR}/plugins.lua" $@
