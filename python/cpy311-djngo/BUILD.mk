
PYPACK1_DEPS := lib/ncurses lib/readline lib/gdbm \
				  lib/openssl lib/libexpat lib/libuuid \
				  lib/libyaml cosmo-repo/compress \
				  cosmo-repo/base gui/SDL2 compress/xz \
				  compress/lz4

$(eval $(call SPECIFY_DEPS,python/cpy311-djngo,$(PYPACK1_DEPS)))

o/python/cpy311-djngo/downloaded: \
	DL_COMMAND = rm -rf ./djngo && \
		git clone --quiet --depth=1 --branch=djngo https://github.com/ceonlabs/cpython djngo

o/python/cpy311-djngo/patched: \
	PATCH_COMMAND = $(DUMMYLINK0)

o/python/cpy311-djngo/configured.x86_64: CONFIG_COMMAND = $(BASELOC)/python/cpy311-djngo/config-wrapper
o/python/cpy311-djngo/configured.aarch64: CONFIG_COMMAND = $(BASELOC)/python/cpy311-djngo/config-wrapper

o/python/cpy311-djngo/built.x86_64: BUILD_COMMAND = $(DUMMYLINK0)
o/python/cpy311-djngo/built.aarch64: BUILD_COMMAND = $(DUMMYLINK0)

o/python/cpy311-djngo/installed.x86_64: INSTALL_COMMAND = $(DUMMYLINK0)
o/python/cpy311-djngo/installed.aarch64: INSTALL_COMMAND = $(DUMMYLINK0)

o/python/cpy311-djngo/built.fat: FATTEN_COMMAND = $(BASELOC)/python/cpy311-djngo/fatten

djngo: o/python/cpy311-djngo/built.fat
.PHONY: djngo
