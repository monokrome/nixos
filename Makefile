NIXFLAGS ?=
NIXOS_ARCH ?= x86_64
NIXOS_CONFIG ?= iso.nix
NIXOS_MODULE ?= config.system.build.isoImage
NIXOS_PACKAGE ?= nixos
NIXOS_VERSION ?= 18.03
NIXPKGS_PATH ?= nixpkgs
NIXPKGS_REPO ?= https://github.com/NixOS/nixpkgs

out = result

target = $(out)/iso/$(NIXOS_PACKAGE)-$(NIXOS_VERSION).git.meow-x86_64-linux.iso

all: $(target)
.PHONY: all
	
$(target): nixpkgs
	nix-build $(NIXFLAGS) \
		-A $(NIXOS_MODULE) \
		-I nixos-config=$(NIXOS_CONFIG) \
		$(NIXPKGS_PATH)/$(NIXOS_PACKAGE)

$(NIXPKGS_PATH):
	git clone $(NIXOS_REPO )\
		--branch $(NIXOS_VERSION) \
		--depth=1 $(NIXPKGS_REPO)

clean:
	rm -rf $(out)
.PHONY: clean
