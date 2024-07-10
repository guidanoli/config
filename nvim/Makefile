CONFIG_DIR=~/.config/nvim

.PHONY: install
install: ${CONFIG_DIR}/init.lua ${CONFIG_DIR}/lua/plugins.lua

${CONFIG_DIR}:
	mkdir -p $@

${CONFIG_DIR}/init.lua: ${CONFIG_DIR}
	ln -s "$(pwd)/init.lua" $@

${CONFIG_DIR}/lua:
	mkdir -p $@

${CONFIG_DIR}/lua/plugins.lua: ${CONFIG_DIR}/lua
	ln -s "$(pwd)/plugins.lua" $@
