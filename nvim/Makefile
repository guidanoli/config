# Links NeoVim configuration files

CONFIG_DIR=$(HOME)/.config/nvim
CURRENT_DIR=$(shell pwd)

.PHONY: install
install: ${CONFIG_DIR}/init.lua
install: ${CONFIG_DIR}/nvim-pack-lock.json

${CONFIG_DIR}/init.lua: | ${CONFIG_DIR}
	ln -s "${CURRENT_DIR}/init.lua" $@

${CONFIG_DIR}/nvim-pack-lock.json: | ${CONFIG_DIR}
	ln -s "${CURRENT_DIR}/nvim-pack-lock.json" $@

${CONFIG_DIR}:
	mkdir -p $@
