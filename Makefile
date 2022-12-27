include config.mk

SRCD := $(CURDIR)/src

.DEFAULT_GOAL := help

.SILENT: help
.PHONY: help # print help
help:
	grep '^.PHONY: .* #' $(firstword $(MAKEFILE_LIST)) |\
	sed 's/\.PHONY: \(.*\) # \(.*\)/\1 # \2/' |\
	awk 'BEGIN {FS = "#"}; {printf "%-30s%s\n", $$1, $$2}'

.SILENT: build
.PHONY: build # @combo [clean deps link]
build: clean dirs deps link

.SILENT: deps
.PHONY: deps # install required dependencies
deps:
	$(PKGC) $(DEPS)

.PHONY: dirs # create required dirs
dirs:
	mkdir -p ${HOME}/.config
	mkdir -p ${HOME}/.local
	mkdir -p ${HOME}/.cache

.PHONY: link # link neovim
link:
	ln -sf $(SRCD) ${HOME}/.config/zsh
	ln -sf ${HOME}/.config/zsh/.zshenv ${HOME}/.zprofile
	ln -sf ${HOME}/.config/zsh/.zshenv ${HOME}/.profile
	find $(XDIR)/* -iname '*.zsh' | xargs -r -I {} ln -sf {} $(CURDIR)/src/lib/sys

.PHONY: clean # clean/unlink neovim
clean:
	rm -rf ${HOME}/.cache/zsh
	rm -rf ${HOME}/.local/share/zsh
	rm -f ${HOME}/.profile
	rm -f ${HOME}/.zprofile
	rm -rf ${HOME}/.config/zsh
	find $(CURDIR)/src/lib/sys/* -iname '*.zsh' | xargs -r -I {} rm -f {}
