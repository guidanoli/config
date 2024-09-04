# Links Git configuration files

HOME_DIR=~
CURRENT_DIR=$(shell pwd)

.PHONY: 
install: link-ignore link-config

.PHONY: link-ignore
link-init: ${HOME_DIR}/.gitignore

${HOME_DIR}/.gitignore: ${HOME_DIR}
	ln -s "${CURRENT_DIR}/.gitignore" $@

.PHONY: link-config
link-init: ${HOME_DIR}/.gitconfig

${HOME_DIR}/.gitconfig: ${HOME_DIR}
	ln -s "${CURRENT_DIR}/.gitconfig" $@

.PHONY: clean
clean:
	rm -rf ${HOME_DIR}/.gitignore ${HOME_DIR}/.gitconfig
