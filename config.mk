OS := $(shell uname -s)

ifeq "$(OS)" "Linux"
	ID = $(shell grep -w 'ID' /etc/os-release | cut -d '=' -f 2 | tr -d '"')
endif

ifdef ID
	ifeq "$(ID)" "void"
		PKGC = sudo xbps-install -y
		DEPS = $(shell cat ./deps/linux.void.pkgs)
		XDIR = $(CURDIR)/deps/linux.void.sys
	endif
	ifeq "$(ID)" "arch"
		PKGC = sudo pacman -Sy --needed --noconfirm
		DEPS = $(shell cat ./deps/linux.arch.pkgs)
		XDIR = $(CURDIR)/deps/linux.arch.sys
	endif
endif

ifeq "$(OS)" "Darwin"
	PKGC = brew install
	DEPS = $(shell cat ./deps/darwin.pkgs)
	XDIR = $(CURDIR)/deps/darwin.sys
endif

ifndef PKGC
	$(error unknown package manager command)
endif
ifndef DEPS
	$(error unknown dependencies file)
endif
