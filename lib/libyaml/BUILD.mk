
LIBYAML_SRC := https://github.com/yaml/libyaml/archive/refs/tags/0.2.5.tar.gz 

LIBYAML_CONFIG_ARGS =  -DCMAKE_INSTALL_PREFIX=$$(COSMOS) \
     -DBUILD_SHARED_LIBS=OFF\
     -DCMAKE_C_FLAGS="-Os"


o/lib/libyaml/setup: o/lib/libyaml/patched
	touch $@

o/lib/libyaml/configured.x86_64: o/lib/libyaml/setup
o/lib/libyaml/configured.aarch64: o/lib/libyaml/setup

$(eval $(call DOWNLOAD_SOURCE,lib/libyaml,$(LIBYAML_SRC)))
$(eval $(call CMAKE_BUILD,lib/libyaml,$(LIBYAML_CONFIG_ARGS),$(LIBYAML_CONFIG_ARGS)))

o/lib/libyaml/built.fat: FATTEN_COMMAND = $(DUMMYLINK0)
